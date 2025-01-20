@interface WFWidgetConfigurationOptions
- (CGRect)initialConfigurationCardViewFrame;
- (INIntent)intent;
- (NSString)remoteAppLocalizedName;
- (NSString)remoteDeviceIdentifier;
- (NSString)widgetDescription;
- (NSString)widgetDisplayName;
- (NSString)widgetExtensionBundleIdentifier;
- (WFImage)remoteAppIcon;
- (WFWidgetConfigurationOptions)init;
- (int64_t)family;
- (unint64_t)widgetConfigurationStyle;
- (unint64_t)widgetConfigurationType;
- (void)setFamily:(int64_t)a3;
- (void)setInitialConfigurationCardViewFrame:(CGRect)a3;
- (void)setIntent:(id)a3;
- (void)setRemoteAppIcon:(id)a3;
- (void)setRemoteAppLocalizedName:(id)a3;
- (void)setRemoteDeviceIdentifier:(id)a3;
- (void)setWidgetConfigurationStyle:(unint64_t)a3;
- (void)setWidgetConfigurationType:(unint64_t)a3;
- (void)setWidgetDescription:(id)a3;
- (void)setWidgetDisplayName:(id)a3;
- (void)setWidgetExtensionBundleIdentifier:(id)a3;
@end

@implementation WFWidgetConfigurationOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAppIcon, 0);
  objc_storeStrong((id *)&self->_remoteAppLocalizedName, 0);
  objc_storeStrong((id *)&self->_remoteDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetDescription, 0);
  objc_storeStrong((id *)&self->_widgetDisplayName, 0);
  objc_storeStrong((id *)&self->_widgetExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

- (void)setWidgetConfigurationType:(unint64_t)a3
{
  self->_widgetConfigurationType = a3;
}

- (unint64_t)widgetConfigurationType
{
  return self->_widgetConfigurationType;
}

- (void)setRemoteAppIcon:(id)a3
{
}

- (WFImage)remoteAppIcon
{
  return self->_remoteAppIcon;
}

- (void)setRemoteAppLocalizedName:(id)a3
{
}

- (NSString)remoteAppLocalizedName
{
  return self->_remoteAppLocalizedName;
}

- (void)setRemoteDeviceIdentifier:(id)a3
{
}

- (NSString)remoteDeviceIdentifier
{
  return self->_remoteDeviceIdentifier;
}

- (void)setWidgetDescription:(id)a3
{
}

- (NSString)widgetDescription
{
  return self->_widgetDescription;
}

- (void)setWidgetDisplayName:(id)a3
{
}

- (NSString)widgetDisplayName
{
  return self->_widgetDisplayName;
}

- (void)setInitialConfigurationCardViewFrame:(CGRect)a3
{
  self->_initialConfigurationCardViewFrame = a3;
}

- (CGRect)initialConfigurationCardViewFrame
{
  double x = self->_initialConfigurationCardViewFrame.origin.x;
  double y = self->_initialConfigurationCardViewFrame.origin.y;
  double width = self->_initialConfigurationCardViewFrame.size.width;
  double height = self->_initialConfigurationCardViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setWidgetConfigurationStyle:(unint64_t)a3
{
  self->_widgetConfigurationStyle = a3;
}

- (unint64_t)widgetConfigurationStyle
{
  return self->_widgetConfigurationStyle;
}

- (void)setFamily:(int64_t)a3
{
  self->_famildouble y = a3;
}

- (int64_t)family
{
  return self->_family;
}

- (void)setWidgetExtensionBundleIdentifier:(id)a3
{
}

- (NSString)widgetExtensionBundleIdentifier
{
  return self->_widgetExtensionBundleIdentifier;
}

- (void)setIntent:(id)a3
{
}

- (INIntent)intent
{
  return self->_intent;
}

- (WFWidgetConfigurationOptions)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFWidgetConfigurationOptions;
  v2 = [(WFWidgetConfigurationOptions *)&v7 init];
  v3 = (WFWidgetConfigurationOptions *)v2;
  if (v2)
  {
    *((void *)v2 + 4) = 0;
    long long v4 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
    *(_OWORD *)(v2 + 88) = *MEMORY[0x263F001A0];
    *(_OWORD *)(v2 + 104) = v4;
    v5 = v2;
  }

  return v3;
}

@end