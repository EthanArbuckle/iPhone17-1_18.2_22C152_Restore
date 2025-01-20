@interface _UINavigationBarLegacyContentView
- (_UINavigationBarVisualProviderLegacyIOS)visualProvider;
- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3;
- (void)layoutSubviews;
- (void)setVisualProvider:(id)a3;
@end

@implementation _UINavigationBarLegacyContentView

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
}

- (void)layoutSubviews
{
}

- (_UINavigationBarVisualProviderLegacyIOS)visualProvider
{
  return self->_visualProvider;
}

- (void)setVisualProvider:(id)a3
{
  self->_visualProvider = (_UINavigationBarVisualProviderLegacyIOS *)a3;
}

@end