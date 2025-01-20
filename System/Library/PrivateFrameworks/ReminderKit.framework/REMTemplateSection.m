@interface REMTemplateSection
+ (id)cdEntityName;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
- (REMTemplate)parentTemplate;
- (REMTemplateSection)initWithStore:(id)a3 parentTemplate:(id)a4 storage:(id)a5;
@end

@implementation REMTemplateSection

- (REMTemplateSection)initWithStore:(id)a3 parentTemplate:(id)a4 storage:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = [v9 accountCapabilities];
  v15.receiver = self;
  v15.super_class = (Class)REMTemplateSection;
  v13 = [(REMBaseSection *)&v15 initWithStore:v11 accountCapabilities:v12 storage:v10];

  if (v13) {
    objc_storeStrong((id *)&v13->_parentTemplate, a4);
  }

  return v13;
}

+ (id)newObjectID
{
  return +[REMBaseSectionStorage newObjectID];
}

+ (id)objectIDWithUUID:(id)a3
{
  return +[REMBaseSectionStorage objectIDWithUUID:a3];
}

+ (id)cdEntityName
{
  return +[REMTemplateSectionStorage cdEntityName];
}

- (REMTemplate)parentTemplate
{
  return self->_parentTemplate;
}

- (void).cxx_destruct
{
}

@end