@interface SearchConfiguration
- (BEContentCleanupJSOptions)cleanupOptions;
- (BEWebViewFactoryPaginationOptions)paginationOptions;
- (BEWebViewFactoryStylesheetSet)stylesheetSet;
- (CGSize)contentLayoutSize;
- (_TtC8BookEPUB19SearchConfiguration)init;
@end

@implementation SearchConfiguration

- (BEWebViewFactoryPaginationOptions)paginationOptions
{
  return (BEWebViewFactoryPaginationOptions *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                      + OBJC_IVAR____TtC8BookEPUB19SearchConfiguration_paginationOptions));
}

- (BEContentCleanupJSOptions)cleanupOptions
{
  return (BEContentCleanupJSOptions *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                              + OBJC_IVAR____TtC8BookEPUB19SearchConfiguration_cleanupOptions));
}

- (BEWebViewFactoryStylesheetSet)stylesheetSet
{
  return (BEWebViewFactoryStylesheetSet *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                  + OBJC_IVAR____TtC8BookEPUB19SearchConfiguration_stylesheetSet));
}

- (CGSize)contentLayoutSize
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8BookEPUB19SearchConfiguration_contentLayoutSize);
  double v3 = *(double *)&self->paginationOptions[OBJC_IVAR____TtC8BookEPUB19SearchConfiguration_contentLayoutSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC8BookEPUB19SearchConfiguration)init
{
  CGSize result = (_TtC8BookEPUB19SearchConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  double v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8BookEPUB19SearchConfiguration_stylesheetSet);
}

@end