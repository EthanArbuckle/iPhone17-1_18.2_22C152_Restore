@interface MFCardActionSectionData
- (MFCardActionSectionData)initWithActions:(id)a3 viewLayout:(int64_t)a4;
- (NSArray)actions;
- (int64_t)viewLayout;
@end

@implementation MFCardActionSectionData

- (MFCardActionSectionData)initWithActions:(id)a3 viewLayout:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFCardActionSectionData;
  v7 = [(MFCardActionSectionData *)&v11 init];
  if (v7)
  {
    v8 = (NSArray *)[v6 copy];
    actions = v7->_actions;
    v7->_actions = v8;

    v7->_viewLayout = a4;
  }

  return v7;
}

- (NSArray)actions
{
  return self->_actions;
}

- (int64_t)viewLayout
{
  return self->_viewLayout;
}

- (void).cxx_destruct
{
}

@end