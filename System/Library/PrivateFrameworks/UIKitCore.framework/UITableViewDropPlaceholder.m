@interface UITableViewDropPlaceholder
- (void)previewParametersProvider;
- (void)setPreviewParametersProvider:(void *)previewParametersProvider;
@end

@implementation UITableViewDropPlaceholder

- (void)previewParametersProvider
{
  return self->_previewParametersProvider;
}

- (void)setPreviewParametersProvider:(void *)previewParametersProvider
{
}

- (void).cxx_destruct
{
}

@end