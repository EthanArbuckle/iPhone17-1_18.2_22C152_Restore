@interface EmojiTextField
- (_TtC9RemindersP33_4FE8BD245B420E02FDB196B5E5563CD014EmojiTextField)initWithCoder:(id)a3;
- (_TtC9RemindersP33_4FE8BD245B420E02FDB196B5E5563CD014EmojiTextField)initWithFrame:(CGRect)a3;
- (int64_t)_textInputSource;
@end

@implementation EmojiTextField

- (int64_t)_textInputSource
{
  return 1;
}

- (_TtC9RemindersP33_4FE8BD245B420E02FDB196B5E5563CD014EmojiTextField)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[EmojiTextField initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC9RemindersP33_4FE8BD245B420E02FDB196B5E5563CD014EmojiTextField)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(EmojiTextField *)&v5 initWithCoder:a3];
}

@end