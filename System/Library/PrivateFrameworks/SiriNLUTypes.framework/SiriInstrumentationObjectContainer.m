@interface SiriInstrumentationObjectContainer
- (NSMutableArray)tier1Events;
- (SISchemaInstrumentationMessage)mainItem;
- (void)addTier1Event:(id)a3;
- (void)setMainItem:(id)a3;
- (void)setTier1Events:(id)a3;
@end

@implementation SiriInstrumentationObjectContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tier1Events, 0);
  objc_storeStrong((id *)&self->_mainItem, 0);
}

- (void)setTier1Events:(id)a3
{
}

- (NSMutableArray)tier1Events
{
  return self->_tier1Events;
}

- (void)setMainItem:(id)a3
{
}

- (SISchemaInstrumentationMessage)mainItem
{
  return self->_mainItem;
}

- (void)addTier1Event:(id)a3
{
  id v7 = a3;
  v4 = [(SiriInstrumentationObjectContainer *)self tier1Events];

  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(SiriInstrumentationObjectContainer *)self setTier1Events:v5];
  }
  v6 = [(SiriInstrumentationObjectContainer *)self tier1Events];
  [v6 addObject:v7];
}

@end