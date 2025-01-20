@interface RAPPlaceCorrectableFlag
- (BOOL)isEdited;
- (BOOL)originalValue;
- (BOOL)value;
- (NSString)localizedTitle;
- (RAPPlaceCorrectableFlag)initWithKind:(int64_t)a3 originalValue:(BOOL)a4;
- (int64_t)kind;
- (void)_invokeChangeHandlers;
- (void)addObserver:(id)a3 changeHandler:(id)a4;
- (void)removeObserver:(id)a3;
- (void)revertCorrections;
- (void)setValue:(BOOL)a3;
@end

@implementation RAPPlaceCorrectableFlag

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
        ((void (**)(void, RAPPlaceCorrectableFlag *, uint64_t))v9)[2](v9, self, v8);
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (RAPPlaceCorrectableFlag)initWithKind:(int64_t)a3 originalValue:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)RAPPlaceCorrectableFlag;
  result = [(RAPPlaceCorrectableFlag *)&v7 init];
  if (result)
  {
    result->_kind = a3;
    result->_originalValue = a4;
    result->_value = a4;
  }
  return result;
}

- (NSString)localizedTitle
{
  localizedTitle = self->_localizedTitle;
  if (!localizedTitle)
  {
    id v4 = 0;
    switch([(RAPPlaceCorrectableFlag *)self kind])
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

- (void)setValue:(BOOL)a3
{
  if (self->_value != a3)
  {
    self->_value = a3;
    [(RAPPlaceCorrectableFlag *)self _invokeChangeHandlers];
  }
}

- (void)revertCorrections
{
  BOOL v3 = [(RAPPlaceCorrectableFlag *)self originalValue];

  [(RAPPlaceCorrectableFlag *)self setValue:v3];
}

- (BOOL)isEdited
{
  return self->_value != self->_originalValue;
}

- (int64_t)kind
{
  return self->_kind;
}

- (BOOL)value
{
  return self->_value;
}

- (BOOL)originalValue
{
  return self->_originalValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end