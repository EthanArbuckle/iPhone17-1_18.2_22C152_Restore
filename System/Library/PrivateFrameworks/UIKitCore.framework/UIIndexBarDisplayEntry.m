@interface UIIndexBarDisplayEntry
- (UIIndexBarEntry)entry;
- (id)description;
- (int64_t)displayEntryIndex;
- (int64_t)entryIndex;
- (void)setDisplayEntryIndex:(int64_t)a3;
- (void)setEntry:(id)a3;
- (void)setEntryIndex:(int64_t)a3;
@end

@implementation UIIndexBarDisplayEntry

- (void).cxx_destruct
{
}

- (void)setEntryIndex:(int64_t)a3
{
  self->_entryIndex = a3;
}

- (void)setEntry:(id)a3
{
}

- (void)setDisplayEntryIndex:(int64_t)a3
{
  self->_displayEntryIndex = a3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"; entryIndex = %d", self->_entryIndex);
  objc_msgSend(v3, "appendFormat:", @"; displayEntryIndex = %d", self->_displayEntryIndex);
  entry = self->_entry;
  if (entry)
  {
    objc_msgSend(v3, "appendFormat:", @"; type=%d", -[UIIndexBarEntry type](entry, "type"));
    v5 = [(UIIndexBarEntry *)self->_entry title];
    [v3 appendFormat:@"; title='%@'", v5];

    v6 = [(UIIndexBarEntry *)self->_entry shortTitle];
    [v3 appendFormat:@"; shortTitle='%@'", v6];
  }
  [v3 appendString:@">"];
  v7 = (void *)[v3 copy];

  return v7;
}

- (UIIndexBarEntry)entry
{
  return self->_entry;
}

- (int64_t)entryIndex
{
  return self->_entryIndex;
}

- (int64_t)displayEntryIndex
{
  return self->_displayEntryIndex;
}

@end