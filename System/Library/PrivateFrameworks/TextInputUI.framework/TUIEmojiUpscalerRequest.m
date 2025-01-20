@interface TUIEmojiUpscalerRequest
- (NSString)emoji;
- (id)completion;
- (void)setCompletion:(id)a3;
- (void)setEmoji:(id)a3;
@end

@implementation TUIEmojiUpscalerRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_emoji, 0);
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setEmoji:(id)a3
{
}

- (NSString)emoji
{
  return self->_emoji;
}

@end