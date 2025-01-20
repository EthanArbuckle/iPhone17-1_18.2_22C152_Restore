@interface THWAnchoredWidgetWPStyleProvider
- (THWAnchoredWidgetWPStyleProvider)initWithStorage:(id)a3;
- (THWPCoreTextPropertiesFilterDelegate)filterDelegate;
- (TSWPStorage)storage;
- (id)coreTextPropertiesFilterDelegateAtParIndex:(unint64_t)a3;
- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (void)dealloc;
- (void)setFilterDelegate:(id)a3;
@end

@implementation THWAnchoredWidgetWPStyleProvider

- (THWAnchoredWidgetWPStyleProvider)initWithStorage:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THWAnchoredWidgetWPStyleProvider;
  v4 = [(THWAnchoredWidgetWPStyleProvider *)&v6 init];
  if (v4) {
    v4->_storage = (TSWPStorage *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWAnchoredWidgetWPStyleProvider;
  [(THWAnchoredWidgetWPStyleProvider *)&v3 dealloc];
}

- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return [(TSWPStorage *)self->_storage paragraphStyleAtParIndex:a3 effectiveRange:a4];
}

- (id)coreTextPropertiesFilterDelegateAtParIndex:(unint64_t)a3
{
  return [(THWAnchoredWidgetWPStyleProvider *)self filterDelegate];
}

- (TSWPStorage)storage
{
  return self->_storage;
}

- (THWPCoreTextPropertiesFilterDelegate)filterDelegate
{
  return self->_filterDelegate;
}

- (void)setFilterDelegate:(id)a3
{
  self->_filterDelegate = (THWPCoreTextPropertiesFilterDelegate *)a3;
}

@end