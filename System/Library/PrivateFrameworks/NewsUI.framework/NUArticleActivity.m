@interface NUArticleActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSArray)activityItems;
- (NUArticleActivity)initWithActivityType:(id)a3 title:(id)a4 image:(id)a5 performBlock:(id)a6;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (id)performBlock;
- (void)performActivity;
- (void)prepareWithActivityItems:(id)a3;
- (void)setActivityItems:(id)a3;
@end

@implementation NUArticleActivity

- (NUArticleActivity)initWithActivityType:(id)a3 title:(id)a4 image:(id)a5 performBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)NUArticleActivity;
  v15 = [(UIActivity *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_activityType, a3);
    objc_storeStrong((id *)&v16->_activityTitle, a4);
    objc_storeStrong((id *)&v16->_activityImage, a5);
    uint64_t v17 = MEMORY[0x223C968A0](v14);
    id performBlock = v16->_performBlock;
    v16->_id performBlock = (id)v17;
  }
  return v16;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)prepareWithActivityItems:(id)a3
{
}

- (void)performActivity
{
  v3 = [(NUArticleActivity *)self performBlock];

  if (v3)
  {
    v4 = [(NUArticleActivity *)self performBlock];
    v5 = [(NUArticleActivity *)self activityItems];
    ((void (**)(void, void *))v4)[2](v4, v5);
  }

  [(UIActivity *)self activityDidFinish:1];
}

- (id)activityType
{
  return self->_activityType;
}

- (id)activityTitle
{
  return self->_activityTitle;
}

- (id)activityImage
{
  return self->_activityImage;
}

- (id)performBlock
{
  return self->_performBlock;
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (void)setActivityItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityItems, 0);
  objc_storeStrong(&self->_performBlock, 0);
  objc_storeStrong((id *)&self->_activityImage, 0);
  objc_storeStrong((id *)&self->_activityTitle, 0);

  objc_storeStrong((id *)&self->_activityType, 0);
}

@end