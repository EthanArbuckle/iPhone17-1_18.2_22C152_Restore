@interface PDHeadersFooters
- (BOOL)hasDateTime;
- (BOOL)hasFooter;
- (BOOL)hasHeader;
- (BOOL)hasNowDateTime;
- (BOOL)hasSlideNumber;
- (BOOL)hasUserDateTime;
- (id)footer;
- (id)header;
- (id)userDateTime;
- (void)setFooter:(id)a3;
- (void)setHasDateTime:(BOOL)a3;
- (void)setHasFooter:(BOOL)a3;
- (void)setHasHeader:(BOOL)a3;
- (void)setHasNowDateTime:(BOOL)a3;
- (void)setHasSlideNumber:(BOOL)a3;
- (void)setHasUserDateTime:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setUserDateTime:(id)a3;
@end

@implementation PDHeadersFooters

- (BOOL)hasDateTime
{
  return self->mHasDateTime;
}

- (void)setHasDateTime:(BOOL)a3
{
  self->mHasDateTime = a3;
}

- (BOOL)hasNowDateTime
{
  return self->mHasNowDateTime;
}

- (void)setHasNowDateTime:(BOOL)a3
{
  self->mHasNowDateTime = a3;
}

- (BOOL)hasUserDateTime
{
  return self->mHasUserDateTime;
}

- (void)setHasUserDateTime:(BOOL)a3
{
  self->mHasUserDateTime = a3;
}

- (BOOL)hasSlideNumber
{
  return self->mHasSlideNumber;
}

- (void)setHasSlideNumber:(BOOL)a3
{
  self->mHasSlideNumber = a3;
}

- (BOOL)hasHeader
{
  return self->mHasHeader;
}

- (void)setHasHeader:(BOOL)a3
{
  self->mHasHeader = a3;
}

- (BOOL)hasFooter
{
  return self->mHasFooter;
}

- (void)setHasFooter:(BOOL)a3
{
  self->mHasFooter = a3;
}

- (id)userDateTime
{
  return self->mUserDateTime;
}

- (void)setUserDateTime:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  mUserDateTime = self->mUserDateTime;
  self->mUserDateTime = v4;
}

- (id)header
{
  return self->mHeader;
}

- (void)setHeader:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  mHeader = self->mHeader;
  self->mHeader = v4;
}

- (id)footer
{
  return self->mFooter;
}

- (void)setFooter:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  mFooter = self->mFooter;
  self->mFooter = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFooter, 0);
  objc_storeStrong((id *)&self->mHeader, 0);
  objc_storeStrong((id *)&self->mUserDateTime, 0);
}

@end