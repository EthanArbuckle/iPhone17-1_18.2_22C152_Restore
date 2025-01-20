@interface IMDynamicTitleAction
- (id)title;
- (id)titleBlock;
- (void)setTitleBlock:(id)a3;
@end

@implementation IMDynamicTitleAction

- (id)title
{
  v8.receiver = self;
  v8.super_class = (Class)IMDynamicTitleAction;
  v3 = [(IMAction *)&v8 title];
  titleBlock = (void (**)(id, void *))self->_titleBlock;
  if (titleBlock)
  {
    v5 = [(IMAction *)self controller];
    uint64_t v6 = titleBlock[2](titleBlock, v5);

    v3 = (void *)v6;
  }

  return v3;
}

- (id)titleBlock
{
  return self->_titleBlock;
}

- (void)setTitleBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end