@interface _SBWidgetExtensionLaunchRequestResult
- (CHSControlDescriptor)controlDescriptorToUse;
- (CHSWidgetDescriptor)widgetDescriptorToUse;
- (_SBWidgetExtensionLaunchRequestResult)initWithWidgetDescriptor:(id)a3 widgetFamily:(int64_t)a4 controlDescriptor:(id)a5;
- (int64_t)widgetFamily;
@end

@implementation _SBWidgetExtensionLaunchRequestResult

- (_SBWidgetExtensionLaunchRequestResult)initWithWidgetDescriptor:(id)a3 widgetFamily:(int64_t)a4 controlDescriptor:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_SBWidgetExtensionLaunchRequestResult;
  v11 = [(_SBWidgetExtensionLaunchRequestResult *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_widgetFamily = a4;
    objc_storeStrong((id *)&v11->_widgetDescriptorToUse, a3);
    objc_storeStrong((id *)&v12->_controlDescriptorToUse, a5);
  }

  return v12;
}

- (int64_t)widgetFamily
{
  return self->_widgetFamily;
}

- (CHSWidgetDescriptor)widgetDescriptorToUse
{
  return self->_widgetDescriptorToUse;
}

- (CHSControlDescriptor)controlDescriptorToUse
{
  return self->_controlDescriptorToUse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlDescriptorToUse, 0);
  objc_storeStrong((id *)&self->_widgetDescriptorToUse, 0);
}

@end