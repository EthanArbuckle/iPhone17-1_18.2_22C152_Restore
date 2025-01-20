@interface TCTaggedMessage
+ (id)taggedMessageWithMessageText:(id)a3;
- (NSString)messageText;
- (TCTaggedMessage)initWithMessageText:(id)a3;
- (int)messageTag;
@end

@implementation TCTaggedMessage

+ (id)taggedMessageWithMessageText:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithMessageText:v4];

  return v5;
}

- (TCTaggedMessage)initWithMessageText:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TCTaggedMessage;
  v5 = [(TCTaggedMessage *)&v11 init];
  v6 = v5;
  if (v5)
  {
    int v7 = -[TCTaggedMessage initWithMessageText:]::currentTag++;
    v5->mMessageTag = v7;
    uint64_t v8 = [v4 copy];
    mMessageText = v6->mMessageText;
    v6->mMessageText = (NSString *)v8;
  }
  return v6;
}

- (int)messageTag
{
  return self->mMessageTag;
}

- (NSString)messageText
{
  return self->mMessageText;
}

- (void).cxx_destruct
{
}

@end