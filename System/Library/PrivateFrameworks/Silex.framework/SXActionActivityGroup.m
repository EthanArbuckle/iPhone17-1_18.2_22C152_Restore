@interface SXActionActivityGroup
- (NSMutableArray)activities;
- (NSString)title;
- (SXActionActivityGroup)init;
- (SXActionActivityGroup)initWithTitle:(id)a3;
- (SXActionActivityGroup)initWithTitle:(id)a3 sourceView:(id)a4;
- (UIView)sourceView;
- (void)addActivity:(id)a3;
- (void)setActivities:(id)a3;
@end

@implementation SXActionActivityGroup

- (SXActionActivityGroup)init
{
  return [(SXActionActivityGroup *)self initWithTitle:0 sourceView:0];
}

- (SXActionActivityGroup)initWithTitle:(id)a3
{
  return [(SXActionActivityGroup *)self initWithTitle:a3 sourceView:0];
}

- (SXActionActivityGroup)initWithTitle:(id)a3 sourceView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SXActionActivityGroup;
  v9 = [(SXActionActivityGroup *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_sourceView, a4);
    uint64_t v11 = [MEMORY[0x263EFF980] array];
    activities = v10->_activities;
    v10->_activities = (NSMutableArray *)v11;
  }
  return v10;
}

- (void)addActivity:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SXActionActivityGroup *)self activities];
    [v5 addObject:v4];
  }
}

- (NSString)title
{
  return self->_title;
}

- (NSMutableArray)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end