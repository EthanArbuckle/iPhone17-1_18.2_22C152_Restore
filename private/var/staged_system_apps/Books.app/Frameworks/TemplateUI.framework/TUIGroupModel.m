@interface TUIGroupModel
- (NSObject)identifier;
- (TUIGroupModel)init;
- (TUIModelContaining)parentModel;
- (unint64_t)halign;
- (unint64_t)modelKind;
- (unint64_t)span;
- (unint64_t)valign;
- (void)appendContainedChildrenToArray:(id)a3;
- (void)appendLayoutChildrenToArray:(id)a3;
- (void)appendLayoutModelsToArray:(id)a3;
- (void)appendObjectsWithProtocol:(id)a3 toArray:(id)a4;
- (void)onContainedModelsChanged;
- (void)setHalign:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setParentModel:(id)a3;
- (void)setSpan:(unint64_t)a3;
- (void)setValign:(unint64_t)a3;
- (void)updateModelChildren:(id)a3;
@end

@implementation TUIGroupModel

- (TUIGroupModel)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUIGroupModel;
  result = [(TUIGroupModel *)&v3 init];
  if (result) {
    *(_WORD *)&result->_flags = *(_WORD *)&result->_flags & 0xFC00 | 0x20;
  }
  return result;
}

- (unint64_t)halign
{
  return *(_WORD *)&self->_flags & 3;
}

- (void)setHalign:(unint64_t)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFC | a3 & 3;
}

- (unint64_t)valign
{
  return ((unint64_t)*(_WORD *)&self->_flags >> 2) & 7;
}

- (void)setValign:(unint64_t)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFE3 | (4 * (a3 & 7));
}

- (unint64_t)span
{
  return ((unint64_t)*(_WORD *)&self->_flags >> 5) & 0x1F;
}

- (void)setSpan:(unint64_t)a3
{
  if (a3 <= 1) {
    char v3 = 1;
  }
  else {
    char v3 = a3;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFC1F | (32 * (v3 & 0x1F));
}

- (unint64_t)modelKind
{
  return 0;
}

- (void)updateModelChildren:(id)a3
{
  children = self->_children;
  id v5 = a3;
  [(NSArray *)children enumerateObjectsUsingBlock:&stru_251AB8];
  v6 = (NSArray *)[v5 copy];

  v7 = self->_children;
  self->_children = v6;

  v8 = self->_children;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_188EC;
  v9[3] = &unk_251AE0;
  v9[4] = self;
  [(NSArray *)v8 enumerateObjectsUsingBlock:v9];
  [(TUIGroupModel *)self onContainedModelsChanged];
}

- (void)appendContainedChildrenToArray:(id)a3
{
}

- (void)appendLayoutModelsToArray:(id)a3
{
  id v4 = a3;
  children = self->_children;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_189A0;
  v7[3] = &unk_251AE0;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)children enumerateObjectsUsingBlock:v7];
}

- (void)appendLayoutChildrenToArray:(id)a3
{
  id v4 = a3;
  children = self->_children;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_18A44;
  v7[3] = &unk_251AE0;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)children enumerateObjectsUsingBlock:v7];
}

- (void)appendObjectsWithProtocol:(id)a3 toArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  children = self->_children;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_18B10;
  v11[3] = &unk_251B08;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NSArray *)children enumerateObjectsUsingBlock:v11];
}

- (void)onContainedModelsChanged
{
  id v2 = [(TUIGroupModel *)self parentModel];
  [v2 onContainedModelsChanged];
}

- (TUIModelContaining)parentModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentModel);

  return (TUIModelContaining *)WeakRetained;
}

- (void)setParentModel:(id)a3
{
}

- (NSObject)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_parentModel);

  objc_storeStrong((id *)&self->_children, 0);
}

@end