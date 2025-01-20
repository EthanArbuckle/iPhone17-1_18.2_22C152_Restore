@interface OpusMagazinePageItemDurations
- (NSDictionary)itemDurations;
- (OpusMagazinePageItemDurations)init;
- (double)pageDuration;
- (void)dealloc;
- (void)setItemDurations:(id)a3;
- (void)setPageDuration:(double)a3;
@end

@implementation OpusMagazinePageItemDurations

- (OpusMagazinePageItemDurations)init
{
  v3.receiver = self;
  v3.super_class = (Class)OpusMagazinePageItemDurations;
  result = [(OpusMagazinePageItemDurations *)&v3 init];
  if (result) {
    result->_pageDuration = -1.0;
  }
  return result;
}

- (void)dealloc
{
  itemDurations = self->_itemDurations;
  if (itemDurations)
  {

    self->_itemDurations = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)OpusMagazinePageItemDurations;
  [(OpusMagazinePageItemDurations *)&v4 dealloc];
}

- (NSDictionary)itemDurations
{
  return self->_itemDurations;
}

- (void)setItemDurations:(id)a3
{
}

- (double)pageDuration
{
  return self->_pageDuration;
}

- (void)setPageDuration:(double)a3
{
  self->_pageDuration = a3;
}

@end