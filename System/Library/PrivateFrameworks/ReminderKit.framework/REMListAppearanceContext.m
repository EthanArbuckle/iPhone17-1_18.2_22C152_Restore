@interface REMListAppearanceContext
- (BOOL)showingLargeAttachments;
- (NSString)badgeEmblem;
- (REMList)list;
- (REMListAppearanceContext)initWithList:(id)a3;
- (REMListBadge)badge;
- (void)setList:(id)a3;
@end

@implementation REMListAppearanceContext

- (void).cxx_destruct
{
}

- (REMListAppearanceContext)initWithList:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListAppearanceContext;
  v6 = [(REMListAppearanceContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_list, a3);
  }

  return v7;
}

- (REMListBadge)badge
{
  v2 = [(REMListAppearanceContext *)self list];
  v3 = [v2 badgeEmblem];

  if (v3) {
    v4 = [[REMListBadge alloc] initWithRawValue:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (REMList)list
{
  return self->_list;
}

- (NSString)badgeEmblem
{
  v2 = [(REMListAppearanceContext *)self badge];
  v3 = [v2 emblem];

  return (NSString *)v3;
}

- (BOOL)showingLargeAttachments
{
  v2 = [(REMListAppearanceContext *)self list];
  char v3 = [v2 showingLargeAttachments];

  return v3;
}

- (void)setList:(id)a3
{
}

@end