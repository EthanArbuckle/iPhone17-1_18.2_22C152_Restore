@interface PDCommentAuthor
- (PDCommentAuthor)init;
- (id)description;
- (id)initials;
- (id)name;
- (unsigned)colorIndex;
- (unsigned)id;
- (unsigned)lastCommentIndex;
- (void)setColorIndex:(unsigned int)a3;
- (void)setId:(unsigned int)a3;
- (void)setInitials:(id)a3;
- (void)setLastCommentIndex:(unsigned int)a3;
- (void)setName:(id)a3;
@end

@implementation PDCommentAuthor

- (PDCommentAuthor)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDCommentAuthor;
  result = [(PDCommentAuthor *)&v3 init];
  if (result)
  {
    result->mId = -1;
    *(void *)&result->mLastCommentIndex = -1;
  }
  return result;
}

- (void)setId:(unsigned int)a3
{
  self->mId = a3;
}

- (void)setName:(id)a3
{
}

- (void)setInitials:(id)a3
{
}

- (void)setColorIndex:(unsigned int)a3
{
  self->mColorIndex = a3;
}

- (unsigned)id
{
  return self->mId;
}

- (id)name
{
  return self->mName;
}

- (id)initials
{
  return self->mInitials;
}

- (unsigned)lastCommentIndex
{
  return self->mLastCommentIndex;
}

- (void)setLastCommentIndex:(unsigned int)a3
{
  self->mLastCommentIndex = a3;
}

- (unsigned)colorIndex
{
  return self->mColorIndex;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PDCommentAuthor;
  v2 = [(PDCommentAuthor *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mInitials, 0);
  objc_storeStrong((id *)&self->mName, 0);
}

@end