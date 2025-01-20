@interface WDHyperlinkFieldMarker
- (BOOL)internalLink;
- (NSString)fragment;
- (NSString)link;
- (id)description;
- (int)runType;
- (void)setFragment:(id)a3;
- (void)setInternalLink:(BOOL)a3;
- (void)setLink:(id)a3;
@end

@implementation WDHyperlinkFieldMarker

- (int)runType
{
  return 8;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDHyperlinkFieldMarker;
  v2 = [(WDFieldMarker *)&v4 description];
  return v2;
}

- (BOOL)internalLink
{
  return *((unsigned char *)self + 72) & 1;
}

- (void)setInternalLink:(BOOL)a3
{
  *((unsigned char *)self + 72) = *((unsigned char *)self + 72) & 0xFE | a3;
}

- (NSString)link
{
  return self->mLink;
}

- (void)setLink:(id)a3
{
}

- (NSString)fragment
{
  return self->mFragment;
}

- (void)setFragment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFragment, 0);
  objc_storeStrong((id *)&self->mLink, 0);
}

@end