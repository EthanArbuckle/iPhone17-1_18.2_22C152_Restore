@interface BKTouchContactSet
- (BKTouchContactSet)init;
- (id)copy;
- (id)description;
- (int64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation BKTouchContactSet

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return (unint64_t)[(NSMutableArray *)self->_contacts countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (id)copy
{
  v3 = objc_alloc_init(BKTouchContactSet);
  v4 = (NSMutableArray *)[(NSMutableArray *)self->_contacts mutableCopy];
  contacts = v3->_contacts;
  v3->_contacts = v4;

  for (uint64_t i = 16; i != 256; i += 8)
    *(Class *)((char *)&v3->super.isa + i) = *(Class *)((char *)&self->super.isa + i);
  return v3;
}

- (BKTouchContactSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKTouchContactSet;
  v2 = [(BKTouchContactSet *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    contacts = v2->_contacts;
    v2->_contacts = v3;
  }
  return v2;
}

- (int64_t)count
{
  return (int64_t)[(NSMutableArray *)self->_contacts count];
}

- (void).cxx_destruct
{
}

- (id)description
{
  return +[BSDescriptionStream descriptionForRootObject:self->_contacts];
}

@end