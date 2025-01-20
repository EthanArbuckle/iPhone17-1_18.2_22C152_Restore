@interface _TUIRenderReferenceOverrideAlpha
- (BOOL)updateLayoutAttributes:(id)a3 forIdentifier:(id)a4;
- (TUIRenderReferenceQuery)query;
- (double)alpha;
- (void)setAlpha:(double)a3;
- (void)setQuery:(id)a3;
@end

@implementation _TUIRenderReferenceOverrideAlpha

- (BOOL)updateLayoutAttributes:(id)a3 forIdentifier:(id)a4
{
  return 1;
}

- (TUIRenderReferenceQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (void).cxx_destruct
{
}

@end