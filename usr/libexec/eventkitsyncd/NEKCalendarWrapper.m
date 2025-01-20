@interface NEKCalendarWrapper
- (BOOL)isDefaultEventCalendar;
- (BOOL)isDefaultTaskCalendar;
- (NEKCalendarAttributes)attributes;
- (NEKCalendarWrapper)initWithCalendarRef:(id)a3;
- (NEKCalendarWrapper)initWithCalendarRef:(id)a3 useAttributes:(BOOL)a4;
- (NEKCalendarWrapper)initWithList:(id)a3;
- (NEKCalendarWrapper)initWithList:(id)a3 useAttributes:(BOOL)a4;
- (NEKCalendarWrapper)initWithSourceIdentifier:(id)a3 attributes:(id)a4 calendarIdentifier:(id)a5;
- (NEKSourceID)storeIdentifier;
- (NSString)calendarIdentifier;
- (NSString)description;
- (NSString)objectIdentifier;
- (NSString)oldCalendarIdentifier;
- (NSString)sequencer;
- (int64_t)changeType;
- (void)setCalendarIdentifier:(id)a3;
- (void)setIsDefaultEventCalendar:(BOOL)a3;
- (void)setIsDefaultTaskCalendar:(BOOL)a3;
- (void)setOldCalendarIdentifier:(id)a3;
@end

@implementation NEKCalendarWrapper

- (NEKCalendarWrapper)initWithSourceIdentifier:(id)a3 attributes:(id)a4 calendarIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NEKCalendarWrapper;
  v12 = [(NEKCalendarWrapper *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_storeIdentifier, a3);
    objc_storeStrong((id *)&v13->_attributes, a4);
    objc_storeStrong((id *)&v13->_calendarIdentifier, a5);
  }

  return v13;
}

- (NSString)objectIdentifier
{
  v2 = [(NEKCalendarWrapper *)self calendarIdentifier];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[NSUUID eks_garbageUUID];
  }
  v5 = v4;

  return (NSString *)v5;
}

- (NSString)sequencer
{
  return 0;
}

- (int64_t)changeType
{
  return 2;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  storeIdentifier = self->_storeIdentifier;
  v6 = [(NEKCalendarWrapper *)self objectIdentifier];
  v7 = +[NSString stringWithFormat:@"<%@ %p, source = %@, calendarIdentifier = %@>", v4, self, storeIdentifier, v6];

  return (NSString *)v7;
}

- (NEKSourceID)storeIdentifier
{
  return self->_storeIdentifier;
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (void)setCalendarIdentifier:(id)a3
{
}

- (NSString)oldCalendarIdentifier
{
  return self->_oldCalendarIdentifier;
}

- (void)setOldCalendarIdentifier:(id)a3
{
}

- (NEKCalendarAttributes)attributes
{
  return self->_attributes;
}

- (BOOL)isDefaultTaskCalendar
{
  return self->_isDefaultTaskCalendar;
}

- (void)setIsDefaultTaskCalendar:(BOOL)a3
{
  self->_isDefaultTaskCalendar = a3;
}

- (BOOL)isDefaultEventCalendar
{
  return self->_isDefaultEventCalendar;
}

- (void)setIsDefaultEventCalendar:(BOOL)a3
{
  self->_isDefaultEventCalendar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_oldCalendarIdentifier, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);

  objc_storeStrong((id *)&self->_storeIdentifier, 0);
}

- (NEKCalendarWrapper)initWithList:(id)a3 useAttributes:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4) {
    v7 = [[NEKCalendarAttributes alloc] initWithList:v6];
  }
  else {
    v7 = 0;
  }
  v8 = [v6 account];
  if (v8) {
    id v9 = [[NEKSourceID alloc] initWithAccount:v8];
  }
  else {
    id v9 = 0;
  }
  id v10 = [v6 objectID];
  id v11 = [v10 uuid];
  v12 = [v11 UUIDString];
  id v13 = [v12 copy];

  v14 = [(NEKCalendarWrapper *)self initWithSourceIdentifier:v9 attributes:v7 calendarIdentifier:v13];
  return v14;
}

- (NEKCalendarWrapper)initWithList:(id)a3
{
  return [(NEKCalendarWrapper *)self initWithList:a3 useAttributes:1];
}

- (NEKCalendarWrapper)initWithCalendarRef:(id)a3 useAttributes:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4) {
    v7 = [[NEKCalendarAttributes alloc] initWithCalendar:v6];
  }
  else {
    v7 = 0;
  }
  v8 = [v6 source];
  if (v8) {
    id v9 = [[NEKSourceID alloc] initWithSource:v8];
  }
  else {
    id v9 = 0;
  }
  id v10 = [v6 calendarIdentifier];
  id v11 = [v10 copy];

  v12 = [(NEKCalendarWrapper *)self initWithSourceIdentifier:v9 attributes:v7 calendarIdentifier:v11];
  return v12;
}

- (NEKCalendarWrapper)initWithCalendarRef:(id)a3
{
  return [(NEKCalendarWrapper *)self initWithCalendarRef:a3 useAttributes:1];
}

@end