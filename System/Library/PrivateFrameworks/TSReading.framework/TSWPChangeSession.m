@interface TSWPChangeSession
- (BOOL)isEqualToSession:(id)a3;
- (NSDate)date;
- (TSKAnnotationAuthor)author;
- (unsigned)sessionUID;
- (void)dealloc;
- (void)setAuthor:(id)a3;
- (void)setDate:(id)a3;
- (void)setSessionUID:(unsigned int)a3;
@end

@implementation TSWPChangeSession

- (unsigned)sessionUID
{
  return self->_sessionUID;
}

- (void)setSessionUID:(unsigned int)a3
{
  self->_sessionUID = a3;
}

- (TSKAnnotationAuthor)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->_author = (TSKAnnotationAuthor *)a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->_date = (NSDate *)a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPChangeSession;
  [(TSWPChangeSession *)&v3 dealloc];
}

- (BOOL)isEqualToSession:(id)a3
{
  unsigned int sessionUID = self->_sessionUID;
  return sessionUID == [a3 sessionUID];
}

@end