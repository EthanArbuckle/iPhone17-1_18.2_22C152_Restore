@interface WDStory
- (BOOL)isOle;
- (WDStory)initWithHead:(id)a3;
- (id)head;
- (id)text;
- (void)setOle:(BOOL)a3;
@end

@implementation WDStory

- (WDStory)initWithHead:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDStory;
  v6 = [(WDStory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->mHead, a3);
  }

  return v7;
}

- (id)head
{
  return self->mHead;
}

- (id)text
{
  objc_opt_class();
  v3 = [(OADDrawable *)self->mHead clientData];
  v4 = [v3 textBox];
  id v5 = [v4 text];

  return v5;
}

- (void)setOle:(BOOL)a3
{
  self->mOle = a3;
}

- (BOOL)isOle
{
  return self->mOle;
}

- (void).cxx_destruct
{
}

@end