@interface GeoRequestCounterInterfaces
- (BOOL)supportsMultipleSelection;
- (GeoRequestCounterInterfaces)init;
- (id)currentSelection;
- (id)currentSelectionString;
- (id)stringForRow:(int64_t)a3;
- (int64_t)rowCount;
- (unint64_t)currentInterfaces;
- (void)setSelection:(id)a3;
@end

@implementation GeoRequestCounterInterfaces

- (GeoRequestCounterInterfaces)init
{
  v7.receiver = self;
  v7.super_class = (Class)GeoRequestCounterInterfaces;
  v2 = [(GeoRequestCounterInterfaces *)&v7 init];
  if (v2)
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    v4 = [v3 valueForKey:@"_debug_geoReqCountInterfaces"];

    id v5 = [v4 unsignedIntegerValue];
    v2->_selected = (unint64_t)v5;
    if (!v5) {
      v2->_selected = GEORequestCounterInterfaceType_AllMask;
    }
  }
  return v2;
}

- (BOOL)supportsMultipleSelection
{
  return 1;
}

- (id)currentSelectionString
{
  v2 = GEORequestCounterInterfaceTypesToStrings();
  v3 = [v2 componentsJoinedByString:@", "];

  return v3;
}

- (id)currentSelection
{
  v3 = +[NSMutableIndexSet indexSet];
  uint64_t v4 = GEOAllRequestCounterInterfaceTypesCount;
  if (GEOAllRequestCounterInterfaceTypesCount)
  {
    uint64_t v5 = 0;
    do
    {
      if ((GEOAllRequestCounterInterfaceTypes[v5] & self->_selected) != 0) {
        [v3 addIndex:v5];
      }
      ++v5;
    }
    while (v4 != v5);
  }

  return v3;
}

- (id)stringForRow:(int64_t)a3
{
  v3 = GEORequestCounterInterfaceTypesToStrings();
  uint64_t v4 = [v3 firstObject];

  return v4;
}

- (void)setSelection:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10043A6A4;
  v8[3] = &unk_1012EA500;
  v8[4] = &v9;
  [v4 enumerateIndexesUsingBlock:v8];
  unint64_t v5 = v10[3];
  self->_selected = v5;
  if (!v5) {
    self->_selected = GEORequestCounterInterfaceType_AllMask;
  }
  v6 = +[NSUserDefaults standardUserDefaults];
  objc_super v7 = +[NSNumber numberWithUnsignedInteger:self->_selected];
  [v6 setObject:v7 forKey:@"_debug_geoReqCountInterfaces"];

  _Block_object_dispose(&v9, 8);
}

- (int64_t)rowCount
{
  return GEOAllRequestCounterInterfaceTypesCount;
}

- (unint64_t)currentInterfaces
{
  return self->_selected;
}

@end