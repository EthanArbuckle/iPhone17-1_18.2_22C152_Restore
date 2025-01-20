@interface SBHCustomIconListLayoutProvider
- (NSDictionary)listLayouts;
- (SBHCustomIconListLayoutProvider)init;
- (SBHCustomIconListLayoutProvider)initWithListLayouts:(id)a3;
- (SBHCustomIconListLayoutProvider)initWithListLayouts:(id)a3 defaultLayout:(id)a4;
- (SBIconListLayout)defaultLayout;
- (id)layoutForIconLocation:(id)a3;
@end

@implementation SBHCustomIconListLayoutProvider

- (SBHCustomIconListLayoutProvider)initWithListLayouts:(id)a3 defaultLayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBHCustomIconListLayoutProvider;
  v8 = [(SBHCustomIconListLayoutProvider *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    listLayouts = v8->_listLayouts;
    v8->_listLayouts = (NSDictionary *)v9;

    objc_storeStrong((id *)&v8->_defaultLayout, a4);
  }

  return v8;
}

- (SBHCustomIconListLayoutProvider)initWithListLayouts:(id)a3
{
  return [(SBHCustomIconListLayoutProvider *)self initWithListLayouts:a3 defaultLayout:0];
}

- (SBHCustomIconListLayoutProvider)init
{
  return [(SBHCustomIconListLayoutProvider *)self initWithListLayouts:MEMORY[0x1E4F1CC08] defaultLayout:0];
}

- (id)layoutForIconLocation:(id)a3
{
  id v4 = a3;
  v5 = [(SBHCustomIconListLayoutProvider *)self listLayouts];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v6 = [(SBHCustomIconListLayoutProvider *)self defaultLayout];
  }
  return v6;
}

- (NSDictionary)listLayouts
{
  return self->_listLayouts;
}

- (SBIconListLayout)defaultLayout
{
  return self->_defaultLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultLayout, 0);
  objc_storeStrong((id *)&self->_listLayouts, 0);
}

@end