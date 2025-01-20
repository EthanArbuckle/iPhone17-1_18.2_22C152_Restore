@interface TSLSearchTree
- (TSLSearchTree)init;
- (id)wordsForPrefix:(id)a3;
- (void)dealloc;
- (void)enumerateWordsForPrefix:(id)a3 withBlock:(id)a4;
- (void)insertWord:(id)a3 value:(id)a4;
@end

@implementation TSLSearchTree

- (TSLSearchTree)init
{
  v3.receiver = self;
  v3.super_class = (Class)TSLSearchTree;
  result = [(TSLSearchTree *)&v3 init];
  if (result) {
    result->mRoot = 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSLSearchTree;
  [(TSLSearchTree *)&v3 dealloc];
}

- (void)insertWord:(id)a3 value:(id)a4
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_249604;
  v11 = sub_249614;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_249620;
  v6[3] = &unk_46B768;
  v6[4] = &v7;
  v12 = v6;
  id v5 = [a3 createQueryString];
  self->mRoot = (TSLSearchTreeNode *)(*(uint64_t (**)(void))(v8[5] + 16))();
  free(v5);
  _Block_object_dispose(&v7, 8);
}

- (id)wordsForPrefix:(id)a3
{
  id v4 = [a3 createQueryString];
  id v5 = [(TSLSearchTreeNode *)self->mRoot find:v4];
  free(v4);
  if (!v5) {
    return 0;
  }

  return [v5 collect];
}

- (void)enumerateWordsForPrefix:(id)a3 withBlock:(id)a4
{
  id v6 = [a3 createQueryString];
  [self->mRoot find:v6 traverse:a4];

  free(v6);
}

@end