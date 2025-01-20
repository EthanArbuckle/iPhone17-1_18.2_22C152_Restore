@interface OCDSummary
- (NSString)company;
- (NSString)subject;
- (id)author;
- (id)comments;
- (id)hyperlinkBase;
- (id)keywords;
- (id)title;
- (void)setAuthor:(id)a3;
- (void)setComments:(id)a3;
- (void)setCompany:(id)a3;
- (void)setHyperlinkBase:(id)a3;
- (void)setKeywords:(id)a3;
- (void)setSubject:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation OCDSummary

- (void)setTitle:(id)a3
{
}

- (void)setAuthor:(id)a3
{
}

- (void)setKeywords:(id)a3
{
}

- (void)setComments:(id)a3
{
}

- (void)setHyperlinkBase:(id)a3
{
}

- (id)title
{
  return self->mTitle;
}

- (id)author
{
  return self->mAuthor;
}

- (id)keywords
{
  return self->mKeywords;
}

- (id)comments
{
  return self->mComments;
}

- (id)hyperlinkBase
{
  return self->mHyperlinkBase;
}

- (NSString)subject
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSubject:(id)a3
{
}

- (NSString)company
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCompany:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_company, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->mHyperlinkBase, 0);
  objc_storeStrong((id *)&self->mComments, 0);
  objc_storeStrong((id *)&self->mKeywords, 0);
  objc_storeStrong((id *)&self->mAuthor, 0);
  objc_storeStrong((id *)&self->mTitle, 0);
}

@end