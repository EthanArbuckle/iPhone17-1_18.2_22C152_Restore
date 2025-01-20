@interface UIPrintFinishingChoice
- (NSDictionary)finishingChoiceInfo;
- (NSString)title;
- (UIPrintFinishingChoice)initWithTitle:(id)a3 finishingChoiceID:(int64_t)a4 finishingChoiceInfo:(id)a5;
- (int64_t)finishingChoiceID;
- (void)setFinishingChoiceID:(int64_t)a3;
- (void)setFinishingChoiceInfo:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation UIPrintFinishingChoice

- (UIPrintFinishingChoice)initWithTitle:(id)a3 finishingChoiceID:(int64_t)a4 finishingChoiceInfo:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)UIPrintFinishingChoice;
  v11 = [(UIPrintFinishingChoice *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a3);
    v12->_finishingChoiceID = a4;
    objc_storeStrong((id *)&v12->_finishingChoiceInfo, a5);
  }

  return v12;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (int64_t)finishingChoiceID
{
  return self->_finishingChoiceID;
}

- (void)setFinishingChoiceID:(int64_t)a3
{
  self->_finishingChoiceID = a3;
}

- (NSDictionary)finishingChoiceInfo
{
  return self->_finishingChoiceInfo;
}

- (void)setFinishingChoiceInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishingChoiceInfo, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end