@interface RAPPlaceCorrectableCollection
- (BOOL)containsObject:(id)a3;
- (BOOL)hasReachedCapacity;
- (BOOL)isEdited;
- (NSArray)originalValues;
- (NSArray)values;
- (NSString)localizedTitle;
- (RAPPlaceCorrectableCollection)initWithKind:(int64_t)a3 originalValues:(id)a4;
- (RAPPlaceCorrectableCollection)initWithKind:(int64_t)a3 originalValues:(id)a4 maxCount:(unint64_t)a5;
- (id)addedObjects;
- (id)removedObjects;
- (int64_t)kind;
- (unint64_t)count;
- (void)_invokeChangeHandlers;
- (void)_setLocalizedTitle:(id)a3;
- (void)addObject:(id)a3;
- (void)addObserver:(id)a3 changeHandler:(id)a4;
- (void)clearAndReplaceObjects:(id)a3;
- (void)removeObject:(id)a3;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)removeObserver:(id)a3;
- (void)revertCorrections;
@end

@implementation RAPPlaceCorrectableCollection

- (void)addObserver:(id)a3 changeHandler:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  observers = self->_observers;
  if (!observers)
  {
    v8 = +[NSMapTable weakToStrongObjectsMapTable];
    v9 = self->_observers;
    self->_observers = v8;

    observers = self->_observers;
  }
  id v10 = [v6 copy];
  [(NSMapTable *)observers setObject:v10 forKey:v11];
}

- (void)removeObserver:(id)a3
{
}

- (void)_invokeChangeHandlers
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(NSMapTable *)self->_observers keyEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        v9 = [(NSMapTable *)self->_observers objectForKey:v8];
        ((void (**)(void, RAPPlaceCorrectableCollection *, uint64_t))v9)[2](v9, self, v8);
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (NSString)localizedTitle
{
  localizedTitle = self->_localizedTitle;
  if (!localizedTitle)
  {
    id v4 = 0;
    switch([(RAPPlaceCorrectableCollection *)self kind])
    {
      case 0:
        id v5 = +[NSBundle mainBundle];
        uint64_t v6 = v5;
        CFStringRef v7 = @"Name [Report a Problem label]";
        goto LABEL_21;
      case 1:
        id v5 = +[NSBundle mainBundle];
        uint64_t v6 = v5;
        CFStringRef v7 = @"Address [Report a Problem label]";
        goto LABEL_21;
      case 2:
        id v5 = +[NSBundle mainBundle];
        uint64_t v6 = v5;
        CFStringRef v7 = @"Phone [Report a Problem label]";
        goto LABEL_21;
      case 3:
        id v5 = +[NSBundle mainBundle];
        uint64_t v6 = v5;
        CFStringRef v7 = @"Hours [Report a Problem label]";
        goto LABEL_21;
      case 4:
        id v5 = +[NSBundle mainBundle];
        uint64_t v6 = v5;
        CFStringRef v7 = @"Website [Report a Problem label]";
        goto LABEL_21;
      case 5:
        id v5 = +[NSBundle mainBundle];
        uint64_t v6 = v5;
        CFStringRef v7 = @"Category [Report a Problem label]";
        goto LABEL_21;
      case 6:
        id v5 = +[NSBundle mainBundle];
        uint64_t v6 = v5;
        CFStringRef v7 = @"Closed Temporarily [Report an Issue]";
        goto LABEL_21;
      case 7:
        id v5 = +[NSBundle mainBundle];
        uint64_t v6 = v5;
        CFStringRef v7 = @"Closed Permanently [Report an Issue]";
        goto LABEL_21;
      case 8:
        id v5 = +[NSBundle mainBundle];
        uint64_t v6 = v5;
        CFStringRef v7 = @"Street [Report a Problem Address Type]";
        goto LABEL_21;
      case 9:
        id v5 = +[NSBundle mainBundle];
        uint64_t v6 = v5;
        CFStringRef v7 = @"Subpremise [Report a Problem Address Type]";
        goto LABEL_21;
      case 0xALL:
        id v5 = +[NSBundle mainBundle];
        uint64_t v6 = v5;
        CFStringRef v7 = @"SubLocality [Report a Problem Address Type]";
        goto LABEL_21;
      case 0xBLL:
        id v5 = +[NSBundle mainBundle];
        uint64_t v6 = v5;
        CFStringRef v7 = @"City [Report a Problem Address Type]";
        goto LABEL_21;
      case 0xCLL:
        id v5 = +[NSBundle mainBundle];
        uint64_t v6 = v5;
        CFStringRef v7 = @"State [Report a Problem Address Type]";
        goto LABEL_21;
      case 0xDLL:
        id v5 = +[NSBundle mainBundle];
        uint64_t v6 = v5;
        CFStringRef v7 = @"ZIP [Report a Problem Address Type]";
        goto LABEL_21;
      case 0xELL:
        id v5 = +[NSBundle mainBundle];
        uint64_t v6 = v5;
        CFStringRef v7 = @"Country [Report a Problem Address Type]";
        goto LABEL_21;
      case 0xFLL:
        id v5 = +[NSBundle mainBundle];
        uint64_t v6 = v5;
        CFStringRef v7 = @"Accepts Apple Pay [Report a Problem label]";
        goto LABEL_21;
      case 0x14:
        id v5 = +[NSBundle mainBundle];
        uint64_t v6 = v5;
        CFStringRef v7 = @"Located Inside [Report an Issue]";
        goto LABEL_21;
      case 0x15:
        id v5 = +[NSBundle mainBundle];
        uint64_t v6 = v5;
        CFStringRef v7 = @"Inside this place [Report an Issue]";
LABEL_21:
        id v4 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:0];

        break;
      default:
        break;
    }
    uint64_t v8 = self->_localizedTitle;
    self->_localizedTitle = v4;

    localizedTitle = self->_localizedTitle;
  }

  return localizedTitle;
}

- (void)_setLocalizedTitle:(id)a3
{
}

- (BOOL)hasReachedCapacity
{
  return (unint64_t)[(NSMutableArray *)self->_mutableValues count] >= self->_maxCount;
}

- (RAPPlaceCorrectableCollection)initWithKind:(int64_t)a3 originalValues:(id)a4
{
  return [(RAPPlaceCorrectableCollection *)self initWithKind:a3 originalValues:a4 maxCount:-1];
}

- (RAPPlaceCorrectableCollection)initWithKind:(int64_t)a3 originalValues:(id)a4 maxCount:(unint64_t)a5
{
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RAPPlaceCorrectableCollection;
  v9 = [(RAPPlaceCorrectableCollection *)&v16 init];
  long long v10 = v9;
  if (!v8) {
    id v8 = &__NSArray0__struct;
  }
  if (v9)
  {
    v9->_kind = a3;
    long long v11 = (NSArray *)[v8 copy];
    originalValues = v10->_originalValues;
    v10->_originalValues = v11;

    long long v13 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v10->_originalValues copyItems:1];
    mutableValues = v10->_mutableValues;
    v10->_mutableValues = v13;

    v10->_maxCount = a5;
  }

  return v10;
}

- (BOOL)containsObject:(id)a3
{
  return [(NSMutableArray *)self->_mutableValues containsObject:a3];
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_mutableValues, "containsObject:") & 1) == 0)
  {
    [(NSMutableArray *)self->_mutableValues addObject:v4];
    [(RAPPlaceCorrectableCollection *)self _invokeChangeHandlers];
  }
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_mutableValues count] > a3)
  {
    [(NSMutableArray *)self->_mutableValues removeObjectAtIndex:a3];
    [(RAPPlaceCorrectableCollection *)self _invokeChangeHandlers];
  }
}

- (void)removeObject:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray containsObject:](self->_mutableValues, "containsObject:"))
  {
    [(NSMutableArray *)self->_mutableValues removeObject:v4];
    [(RAPPlaceCorrectableCollection *)self _invokeChangeHandlers];
  }
}

- (id)addedObjects
{
  id v3 = [objc_alloc((Class)NSMutableSet) initWithArray:self->_mutableValues];
  id v4 = [objc_alloc((Class)NSSet) initWithArray:self->_originalValues];
  [v3 minusSet:v4];
  id v5 = [v3 allObjects];

  return v5;
}

- (id)removedObjects
{
  id v3 = [objc_alloc((Class)NSMutableSet) initWithArray:self->_originalValues];
  id v4 = [objc_alloc((Class)NSSet) initWithArray:self->_mutableValues];
  [v3 minusSet:v4];
  id v5 = [v3 allObjects];

  return v5;
}

- (void)clearAndReplaceObjects:(id)a3
{
  id v4 = a3;
  id v5 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v4];

  mutableValues = self->_mutableValues;
  self->_mutableValues = v5;

  [(RAPPlaceCorrectableCollection *)self _invokeChangeHandlers];
}

- (NSArray)values
{
  id v2 = [(NSMutableArray *)self->_mutableValues copy];

  return (NSArray *)v2;
}

- (void)revertCorrections
{
  id v3 = objc_alloc((Class)NSMutableArray);
  id v6 = [(NSArray *)self->_originalValues copy];
  id v4 = (NSMutableArray *)[v3 initWithArray:v6];
  mutableValues = self->_mutableValues;
  self->_mutableValues = v4;
}

- (BOOL)isEdited
{
  id v3 = [objc_alloc((Class)NSSet) initWithArray:self->_originalValues];
  id v4 = objc_alloc((Class)NSSet);
  id v5 = [(NSMutableArray *)self->_mutableValues copy];
  id v6 = [v4 initWithArray:v5];

  LOBYTE(v5) = [v6 isEqualToSet:v3] ^ 1;
  return (char)v5;
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_mutableValues count];
}

- (int64_t)kind
{
  return self->_kind;
}

- (NSArray)originalValues
{
  return self->_originalValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_originalValues, 0);
  objc_storeStrong((id *)&self->_mutableValues, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end