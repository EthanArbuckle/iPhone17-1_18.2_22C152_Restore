@interface FCEditorialOperationGroup
- (FCSectionProviding)section;
- (NSArray)headlines;
- (NSDate)publishDate;
- (void)setHeadlines:(id)a3;
- (void)setPublishDate:(id)a3;
- (void)setSection:(id)a3;
@end

@implementation FCEditorialOperationGroup

- (FCSectionProviding)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
}

- (NSArray)headlines
{
  return self->_headlines;
}

- (void)setHeadlines:(id)a3
{
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (void)setPublishDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_headlines, 0);
  objc_storeStrong((id *)&self->_section, 0);
}

@end