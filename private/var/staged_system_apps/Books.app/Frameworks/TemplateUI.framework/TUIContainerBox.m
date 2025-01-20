@interface TUIContainerBox
- (BOOL)allowDynamicWindowInstantiation;
- (void)appendContainedChildrenToArray:(id)a3;
- (void)appendLayoutChildrenToArray:(id)a3;
- (void)updateModelChildren:(id)a3;
@end

@implementation TUIContainerBox

- (void)updateModelChildren:(id)a3
{
  id v4 = a3;
  [(NSArray *)self->_children enumerateObjectsUsingBlock:&stru_257550];
  v5 = (NSArray *)[v4 copy];
  children = self->_children;
  self->_children = v5;

  v7 = self->_children;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_18A9E0;
  v8[3] = &unk_2550F8;
  v8[4] = self;
  [(NSArray *)v7 enumerateObjectsUsingBlock:v8];
  [(TUIContainerBox *)self onContainedModelsChanged];
}

- (void)appendContainedChildrenToArray:(id)a3
{
}

- (void)appendLayoutChildrenToArray:(id)a3
{
  id v4 = a3;
  children = self->_children;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_18AABC;
  v7[3] = &unk_2550F8;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)children enumerateObjectsUsingBlock:v7];
}

- (BOOL)allowDynamicWindowInstantiation
{
  return 0;
}

- (void).cxx_destruct
{
}

@end