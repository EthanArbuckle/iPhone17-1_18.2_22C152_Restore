@interface ICActivity
- (ICActivity)init;
- (ICActivity)initWithPerformActivity:(id)a3;
- (UIPopoverPresentationControllerSourceItem)presentationSourceItem;
- (id)actionWithCompletion:(id)a3;
- (id)menuWithCompletion:(id)a3;
- (id)performActivityBlock;
- (int64_t)contextPathEnum;
- (void)commonInit;
- (void)performActivityWithCompletion:(id)a3;
- (void)setContextPathEnum:(int64_t)a3;
- (void)setPerformActivityBlock:(id)a3;
- (void)setPresentationSourceItem:(id)a3;
@end

@implementation ICActivity

- (ICActivity)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICActivity;
  v2 = [(UIActivity *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ICActivity *)v2 commonInit];
  }
  return v3;
}

- (ICActivity)initWithPerformActivity:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(ICActivity *)self init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id performActivityBlock = v5->_performActivityBlock;
    v5->_id performActivityBlock = v6;

    [(ICActivity *)v5 commonInit];
  }

  return v5;
}

- (void)commonInit
{
  self->_contextPathEnum = 0;
}

- (id)actionWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x1E4FB13F0];
  v6 = [(UIActivity *)self activityTitle];
  v7 = [(UIActivity *)self activityImage];
  v8 = [(ICActivity *)self actionIdentifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __35__ICActivity_actionWithCompletion___block_invoke;
  v12[3] = &unk_1E5FDD0B0;
  v12[4] = self;
  id v13 = v4;
  id v9 = v4;
  v10 = [v5 actionWithTitle:v6 image:v7 identifier:v8 handler:v12];

  return v10;
}

uint64_t __35__ICActivity_actionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 presentationSourceItem];
  [*(id *)(a1 + 32) setPresentationSourceItem:v3];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 performActivityWithCompletion:v5];
}

- (id)menuWithCompletion:(id)a3
{
  return 0;
}

- (void)performActivityWithCompletion:(id)a3
{
  id v8 = a3;
  id v4 = [(ICActivity *)self performActivityBlock];

  if (v4)
  {
    uint64_t v5 = [(ICActivity *)self performActivityBlock];
    v5[2]();
  }
  [(UIActivity *)self activityDidFinish:1];
  v6 = v8;
  if (v8)
  {
    v7 = [(UIActivity *)self activityType];
    (*((void (**)(id, uint64_t, void *))v8 + 2))(v8, 1, v7);

    v6 = v8;
  }
}

- (int64_t)contextPathEnum
{
  return self->_contextPathEnum;
}

- (void)setContextPathEnum:(int64_t)a3
{
  self->_contextPathEnum = a3;
}

- (UIPopoverPresentationControllerSourceItem)presentationSourceItem
{
  return self->_presentationSourceItem;
}

- (void)setPresentationSourceItem:(id)a3
{
}

- (id)performActivityBlock
{
  return self->_performActivityBlock;
}

- (void)setPerformActivityBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_performActivityBlock, 0);
  objc_storeStrong((id *)&self->_presentationSourceItem, 0);
}

@end