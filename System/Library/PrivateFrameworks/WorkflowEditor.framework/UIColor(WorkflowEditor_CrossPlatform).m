@interface UIColor(WorkflowEditor_CrossPlatform)
+ (id)wf_slotTemplateSlotBackgroundColorWithTintColor:()WorkflowEditor_CrossPlatform;
+ (id)wf_slotTemplateSlotErrorBackgroundColor;
+ (id)wf_slotTemplateSlotErrorHighlightedBackgroundColor;
+ (id)wf_slotTemplateSlotHighlightedBackgroundColorWithTintColor:()WorkflowEditor_CrossPlatform;
+ (id)wf_slotTemplateSlotRunningBackgroundColor;
+ (id)wf_slotTemplateSlotRunningTitleColor;
+ (id)wf_slotTemplateSlotTitleColorWithTintColor:()WorkflowEditor_CrossPlatform;
@end

@implementation UIColor(WorkflowEditor_CrossPlatform)

+ (id)wf_slotTemplateSlotErrorHighlightedBackgroundColor
{
  v1 = objc_msgSend(a1, "wf_slotTemplateSlotErrorTitleColor");
  v2 = [v1 colorWithAlphaComponent:0.25];

  return v2;
}

+ (id)wf_slotTemplateSlotErrorBackgroundColor
{
  v1 = objc_msgSend(a1, "wf_slotTemplateSlotErrorTitleColor");
  v2 = [v1 colorWithAlphaComponent:0.0599999987];

  return v2;
}

+ (id)wf_slotTemplateSlotRunningBackgroundColor
{
  v0 = [MEMORY[0x263F851A8] colorWithP3RGBAValue:1289315583];
  v1 = [v0 platformColor];
  v2 = [v1 colorWithAlphaComponent:0.100000001];

  return v2;
}

+ (id)wf_slotTemplateSlotHighlightedBackgroundColorWithTintColor:()WorkflowEditor_CrossPlatform
{
  v1 = objc_msgSend(a1, "wf_slotTemplateSlotTitleColorWithTintColor:");
  v2 = [v1 colorWithAlphaComponent:0.25];

  return v2;
}

+ (id)wf_slotTemplateSlotBackgroundColorWithTintColor:()WorkflowEditor_CrossPlatform
{
  v1 = objc_msgSend(a1, "wf_slotTemplateSlotTitleColorWithTintColor:");
  v2 = [v1 colorWithAlphaComponent:0.0700000003];

  return v2;
}

+ (id)wf_slotTemplateSlotRunningTitleColor
{
  v0 = [MEMORY[0x263F851A8] colorWithP3RGBAValue:1034703103];
  v1 = [v0 platformColor];

  return v1;
}

+ (id)wf_slotTemplateSlotTitleColorWithTintColor:()WorkflowEditor_CrossPlatform
{
  id v3 = a3;
  return v3;
}

@end