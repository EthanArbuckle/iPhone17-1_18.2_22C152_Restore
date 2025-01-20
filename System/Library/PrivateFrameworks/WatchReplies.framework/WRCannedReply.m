@interface WRCannedReply
- (NSString)defaultReplyKey;
- (NSString)defaultReplyText;
- (NSString)text;
- (void)setDefaultReplyKey:(id)a3;
- (void)setDefaultReplyText:(id)a3;
- (void)setText:(id)a3;
@end

@implementation WRCannedReply

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)defaultReplyText
{
  return self->_defaultReplyText;
}

- (void)setDefaultReplyText:(id)a3
{
}

- (NSString)defaultReplyKey
{
  return self->_defaultReplyKey;
}

- (void)setDefaultReplyKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultReplyKey, 0);
  objc_storeStrong((id *)&self->_defaultReplyText, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end