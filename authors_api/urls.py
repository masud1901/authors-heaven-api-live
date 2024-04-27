from django.conf import settings
from django.contrib import admin
from django.urls import path, include
from drf_yasg import openapi
from drf_yasg.views import get_schema_view
from rest_framework import permissions


schema_view = get_schema_view(
    openapi.Info(
        title="Authors API",
        default_version="v1",
        description="Authors API",
        terms_of_service="https://www.google.com/policies/terms/",
    ),
    public=True,
    permission_classes=(permissions.AllowAny,),
)


urlpatterns = [
    path(
        "redoc/",
        schema_view.with_ui("redoc", cache_kwargs=0),
        name="schema-redoc",
    ),
    path(
        "docs/",
        schema_view.with_ui("swagger", cache_timeout=0),
        name="schema-swagger-ui",
    ),
    path(settings.ADMIN_URL, admin.site.urls),
]


admin.site.site_header = "Authors Heaven API Admin"
admin.site.site_title = "Authors Heaven API Admin Portal"
admin.site.index_title = "Welcome to Authors Heaven API Admin Portal"
