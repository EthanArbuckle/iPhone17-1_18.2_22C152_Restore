@interface PDComment
- (CGPoint)position;
- (NSString)author;
- (PDComment)init;
- (PDComment)parent;
- (id)date;
- (id)description;
- (id)text;
- (unint64_t)authorId;
- (unsigned)index;
- (void)setAuthor:(id)a3;
- (void)setAuthorId:(unint64_t)a3;
- (void)setDate:(id)a3;
- (void)setIndex:(unsigned int)a3;
- (void)setParent:(id)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setText:(id)a3;
@end

@implementation PDComment

- (PDComment)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDComment;
  result = [(PDComment *)&v3 init];
  if (result)
  {
    result->mAuthorId = -1;
    result->mIndex = -1;
  }
  return result;
}

- (CGPoint)position
{
  double x = self->mPosition.x;
  double y = self->mPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->mPosition = a3;
}

- (id)text
{
  return self->mText;
}

- (void)setText:(id)a3
{
}

- (unint64_t)authorId
{
  return self->mAuthorId;
}

- (void)setAuthorId:(unint64_t)a3
{
  self->mAuthorId = a3;
}

- (id)date
{
  return self->mDate;
}

- (void)setDate:(id)a3
{
}

- (unsigned)index
{
  return self->mIndex;
}

- (void)setIndex:(unsigned int)a3
{
  self->mIndedouble x = a3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PDComment;
  v2 = [(PDComment *)&v4 description];
  return v2;
}

- (PDComment)parent
{
  return (PDComment *)objc_getProperty(self, a2, 56, 1);
}

- (void)setParent:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->parent, 0);
  objc_storeStrong((id *)&self->mDate, 0);
  objc_storeStrong((id *)&self->mText, 0);
}

@end