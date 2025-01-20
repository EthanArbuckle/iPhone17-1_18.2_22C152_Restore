@interface _UIDebugLogStatement
- (NSString)prefix;
- (NSString)text;
- (_UIDebugLogStatement)init;
- (int64_t)type;
- (unint64_t)indentLevel;
- (void)setIndentLevel:(unint64_t)a3;
- (void)setPrefix:(id)a3;
- (void)setText:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation _UIDebugLogStatement

- (_UIDebugLogStatement)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UIDebugLogStatement;
  v2 = [(_UIDebugLogStatement *)&v7 init];
  v3 = v2;
  if (v2)
  {
    prefix = v2->_prefix;
    v2->_prefix = (NSString *)&stru_1ED0E84C0;

    text = v3->_text;
    v3->_text = (NSString *)&stru_1ED0E84C0;
  }
  return v3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (unint64_t)indentLevel
{
  return self->_indentLevel;
}

- (void)setIndentLevel:(unint64_t)a3
{
  self->_indentLevel = a3;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
}

@end