@interface BKTextRangeRotorInfo
- (BookTextRange)textRange;
- (NSString)text;
- (NSString)type;
- (id)description;
- (int64_t)compare:(id)a3;
- (void)setText:(id)a3;
- (void)setTextRange:(id)a3;
@end

@implementation BKTextRangeRotorInfo

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(BKTextRangeRotorInfo *)self textRange];
  id v6 = [v5 range];
  unint64_t v8 = v7;

  v9 = [v4 textRange];

  id v10 = [v9 range];
  unint64_t v12 = v11;

  if (v6 < v10) {
    return -1;
  }
  int64_t v14 = -1;
  if (v8 >= v12) {
    int64_t v14 = v8 > v12;
  }
  if (v6 <= v10) {
    return v14;
  }
  else {
    return 1;
  }
}

- (NSString)type
{
  return 0;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(BKTextRangeRotorInfo *)self type];
  v5 = [(BKTextRangeRotorInfo *)self textRange];
  v10.location = (NSUInteger)[v5 range];
  id v6 = NSStringFromRange(v10);
  unint64_t v7 = +[NSString stringWithFormat:@"<%@ %p type=%@ range=%@>", v3, self, v4, v6];

  return v7;
}

- (BookTextRange)textRange
{
  return self->_textRange;
}

- (void)setTextRange:(id)a3
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

  objc_storeStrong((id *)&self->_textRange, 0);
}

@end