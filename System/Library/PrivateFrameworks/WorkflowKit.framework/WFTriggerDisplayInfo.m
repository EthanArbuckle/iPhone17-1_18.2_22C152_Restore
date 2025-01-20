@interface WFTriggerDisplayInfo
- (Class)triggerClass;
- (NSArray)actionIcons;
- (NSString)localizedDescription;
- (NSString)localizedTitle;
- (WFTriggerDisplayInfo)initWithLocalizedTitle:(id)a3 localizedDescription:(id)a4 actionIcons:(id)a5 triggerClass:(Class)a6;
@end

@implementation WFTriggerDisplayInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerClass, 0);
  objc_storeStrong((id *)&self->_actionIcons, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

- (Class)triggerClass
{
  return self->_triggerClass;
}

- (NSArray)actionIcons
{
  return self->_actionIcons;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (WFTriggerDisplayInfo)initWithLocalizedTitle:(id)a3 localizedDescription:(id)a4 actionIcons:(id)a5 triggerClass:(Class)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFTriggerDisplayInfo;
  v14 = [(WFTriggerDisplayInfo *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_localizedTitle, a3);
    objc_storeStrong((id *)&v15->_localizedDescription, a4);
    objc_storeStrong((id *)&v15->_actionIcons, a5);
    objc_storeStrong((id *)&v15->_triggerClass, a6);
    v16 = v15;
  }

  return v15;
}

@end