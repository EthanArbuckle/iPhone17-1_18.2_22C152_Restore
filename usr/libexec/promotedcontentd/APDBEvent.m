@interface APDBEvent
+ (BOOL)_createEventTableWithManager:(id)a3 dayOfYear:(unint64_t)a4;
+ (unint64_t)_currentDayOfYear;
- (APDBEvent)initWithDatabaseManager:(id)a3;
- (APUnfairLock)createTableLock;
- (APUnfairLock)createViewLock;
- (BOOL)_createEventTableIfNeeded;
- (BOOL)_createEventViewForDay:(unint64_t)a3;
- (BOOL)createEventViewIfNeeded;
- (BOOL)dropExpiredEventTables;
- (BOOL)insertEvent:(id)a3 handle:(id)a4 impression:(BOOL)a5 timestamp:(id)a6;
- (BOOL)insertEventWithHandle:(id)a3 campaign:(id)a4 adGroup:(id)a5 ad:(id)a6 creative:(id)a7 bundleId:(id)a8 searchTermId:(id)a9 adamId:(id)a10 adType:(id)a11 adFormatType:(id)a12 containerType:(id)a13 relay:(id)a14 adMetadata:(id)a15 adProperties:(id)a16 brand:(id)a17 advertiserCategory:(id)a18 timestamp:(id)a19 purpose:(id)a20 event:(id)a21 source:(id)a22 unknownSource:(id)a23 handleSet:(id)a24 eventOrder:(id)a25 trace:(id)a26 branch:(id)a27 environment:(id)a28 impression:(id)a29 eventProperties:(id)a30 eventInternalProperties:(id)a31;
- (BOOL)insertReceivedEventWithHandle:(id)a3 bundleId:(id)a4 adamId:(id)a5 adMetadata:(id)a6 adProperties:(id)a7;
- (Class)rowClass;
- (id)_createEventViewQueryForDay:(unint64_t)a3;
- (id)_eventViewTableNamesForDay:(unint64_t)a3;
- (id)allEvents;
- (id)allEventsForHandle:(id)a3;
- (id)impressionEventsForHandle:(id)a3;
- (id)interactedEventsForHandle:(id)a3;
- (id)tableName;
- (int64_t)_expirationOfData;
- (int64_t)_lastEventInsertOrder;
- (int64_t)insertOrder;
- (unint64_t)tableDayOfYear;
- (unint64_t)viewDayOfYear;
- (void)setCreateTableLock:(id)a3;
- (void)setCreateViewLock:(id)a3;
- (void)setInsertOrder:(int64_t)a3;
- (void)setTableDayOfYear:(unint64_t)a3;
- (void)setViewDayOfYear:(unint64_t)a3;
@end

@implementation APDBEvent

+ (unint64_t)_currentDayOfYear
{
  id v2 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSGregorianCalendar];
  v3 = +[NSDate date];
  id v4 = [v2 ordinalityOfUnit:16 inUnit:4 forDate:v3];

  return (unint64_t)v4;
}

+ (BOOL)_createEventTableWithManager:(id)a3 dayOfYear:(unint64_t)a4
{
  id v5 = a3;
  if (v5)
  {
    v6 = +[NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS event_%lu (handle TEXT NOT NULL, timestamp REAL DEFAULT NULL, purpose INTEGER DEFAULT NULL, event INTEGER NOT NULL, source INTEGER DEFAULT NULL, unknownSource TEXT DEFAULT NULL, handleSet INTEGER DEFAULT NULL, eventOrder INTEGER DEFAULT NULL, trace TEXT DEFAULT NULL, branchString TEXT DEFAULT NULL, environmentString TEXT DEFAULT NULL, impression INTEGER NOT NULL, propertiesData BLOB DEFAULT NULL, internalPropertiesData BLOB DEFAULT NULL, insertOrder INTEGER NOT NULL, FOREIGN KEY (handle) REFERENCES APDBAdInstance(handle))", a4];
    unsigned __int8 v7 = [v5 executeQueryFromString:v6];
  }
  else
  {
    v8 = APLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v12 = (id)objc_opt_class();
      id v9 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", buf, 0xCu);
    }
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)tableName
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"event_%lu", +[APDBEvent _currentDayOfYear]);
}

- (Class)rowClass
{
  return (Class)objc_opt_class();
}

- (APDBEvent)initWithDatabaseManager:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[APDBEvent _currentDayOfYear];
  if (+[APDBEvent _createEventTableWithManager:v4 dayOfYear:v5])
  {
    v14.receiver = self;
    v14.super_class = (Class)APDBEvent;
    v6 = [(APDBEvent *)&v14 initWithDatabaseManager:v4];
    unsigned __int8 v7 = v6;
    if (v6)
    {
      v6->_tableDayOfYear = v5;
      [(APDBEvent *)v6 _createEventViewForDay:v5];
      v7->_viewDayOfYear = v5;
      v7->_insertOrder = [(APDBEvent *)v7 _lastEventInsertOrder];
      v8 = (APUnfairLock *)[objc_alloc((Class)APUnfairLock) initWithOptions:1];
      createTableLock = v7->_createTableLock;
      v7->_createTableLock = v8;

      v10 = (APUnfairLock *)[objc_alloc((Class)APUnfairLock) initWithOptions:1];
      createViewLock = v7->_createViewLock;
      v7->_createViewLock = v10;
    }
    self = v7;
    id v12 = self;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)insertEventWithHandle:(id)a3 campaign:(id)a4 adGroup:(id)a5 ad:(id)a6 creative:(id)a7 bundleId:(id)a8 searchTermId:(id)a9 adamId:(id)a10 adType:(id)a11 adFormatType:(id)a12 containerType:(id)a13 relay:(id)a14 adMetadata:(id)a15 adProperties:(id)a16 brand:(id)a17 advertiserCategory:(id)a18 timestamp:(id)a19 purpose:(id)a20 event:(id)a21 source:(id)a22 unknownSource:(id)a23 handleSet:(id)a24 eventOrder:(id)a25 trace:(id)a26 branch:(id)a27 environment:(id)a28 impression:(id)a29 eventProperties:(id)a30 eventInternalProperties:(id)a31
{
  id v62 = a3;
  id v61 = a4;
  id v80 = a5;
  id v37 = a6;
  id v79 = a7;
  id v78 = a8;
  id v38 = a9;
  id v39 = a10;
  id v77 = a11;
  id v76 = a12;
  id v75 = a13;
  id v74 = a14;
  id v73 = a15;
  id v72 = a16;
  id v71 = a17;
  id v70 = a18;
  id v69 = a19;
  id v68 = a20;
  id v67 = a21;
  id v66 = a22;
  id v65 = a23;
  id v64 = a24;
  id v63 = a25;
  id v40 = a26;
  id v41 = a27;
  id v42 = a28;
  id v43 = a29;
  id v44 = a30;
  id v45 = a31;
  v59 = v39;
  v60 = v38;
  if ([(APDBEvent *)self _createEventTableIfNeeded])
  {
    v57 = self;
    id v58 = v37;
    v46 = [(APDBEvent *)self manager];
    v47 = [v46 getTableForClass:objc_opt_class()];

    if (v47)
    {
      id v55 = v38;
      v48 = v61;
      v49 = v62;
      if ([v47 insertOrUpdateAdInstanceWithHandle:v62 campaign:v61 adGroup:v80 ad:v58 creative:v79 bundleId:v78 searchTermId:v55 adamId:v39 adType:v77 adFormatType:v76 containerType:v75 relay:v74 adMetadata:v73 properties:v72 brand:v71 advertiserCategory:v70])
      {
        v56 = [APDBEventRow alloc];
        v50 = (char *)[(APDBEvent *)v57 insertOrder] + 1;
        [(APDBEvent *)v57 setInsertOrder:v50];
        v51 = +[NSNumber numberWithInteger:v50];
        id v52 = [(APDBEventRow *)v56 initHandle:v62 timestamp:v69 purpose:v68 event:v67 source:v66 unknownSource:v65 handleSet:v64 eventOrder:v63 trace:v40 branch:v41 environment:v42 impression:v43 properties:v44 internalProperties:v45 insertOrder:v51 table:v57];

        v48 = v61;
        unsigned __int8 v53 = [v52 save];

        v49 = v62;
      }
      else
      {
        unsigned __int8 v53 = 0;
      }
    }
    else
    {
      unsigned __int8 v53 = 0;
      v48 = v61;
      v49 = v62;
    }

    id v37 = v58;
  }
  else
  {
    unsigned __int8 v53 = 0;
    v48 = v61;
    v49 = v62;
  }

  return v53;
}

- (BOOL)insertReceivedEventWithHandle:(id)a3 bundleId:(id)a4 adamId:(id)a5 adMetadata:(id)a6 adProperties:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([(APDBEvent *)self _createEventTableIfNeeded])
  {
    v17 = [(APDBEvent *)self manager];
    v18 = [v17 getTableForClass:objc_opt_class()];

    if (v18
      && [v18 insertAdInstanceWithHandle:v12 bundleId:v13 adamId:v14 adMetadata:v15 properties:v16])
    {
      v25 = [APDBEventRow alloc];
      v19 = +[NSNumber numberWithBool:0];
      v20 = (char *)[(APDBEvent *)self insertOrder] + 1;
      [(APDBEvent *)self setInsertOrder:v20];
      v21 = +[NSNumber numberWithInteger:v20];
      id v22 = [(APDBEventRow *)v25 initHandle:v12 timestamp:0 event:&off_10024A3D0 impression:v19 insertOrder:v21 table:self];

      unsigned __int8 v23 = [v22 save];
    }
    else
    {
      unsigned __int8 v23 = 0;
    }
  }
  else
  {
    unsigned __int8 v23 = 0;
  }

  return v23;
}

- (BOOL)insertEvent:(id)a3 handle:(id)a4 impression:(BOOL)a5 timestamp:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(APDBEvent *)self _createEventTableIfNeeded])
  {
    id v13 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"handle" forColumnType:3 withValue:v11];
    id v14 = [(APDBEvent *)self manager];
    id v24 = v13;
    id v15 = +[NSArray arrayWithObjects:&v24 count:1];
    id v16 = [v14 executeInsertQuery:@"INSERT OR IGNORE INTO APDBAdInstance(handle) VALUES(?)" withParameters:v15];

    if (v16 == (id)-1)
    {
      unsigned __int8 v22 = 0;
    }
    else
    {
      v17 = [APDBEventRow alloc];
      v18 = +[NSNumber numberWithBool:v7];
      v19 = (char *)[(APDBEvent *)self insertOrder] + 1;
      [(APDBEvent *)self setInsertOrder:v19];
      v20 = +[NSNumber numberWithInteger:v19];
      id v21 = [(APDBEventRow *)v17 initHandle:v11 timestamp:v12 event:v10 impression:v18 insertOrder:v20 table:self];

      unsigned __int8 v22 = [v21 save];
    }
  }
  else
  {
    unsigned __int8 v22 = 0;
  }

  return v22;
}

- (id)allEvents
{
  v3 = [(APDBEvent *)self manager];
  if (v3)
  {
    if ([(APDBEvent *)self createEventViewIfNeeded])
    {
      id v4 = +[NSString stringWithFormat:@"%@ ORDER BY insertOrder ASC", @"SELECT handle, timestamp, purpose, event, source, unknownSource, handleSet, eventOrder, trace, branchString, environmentString, impression, propertiesData, internalPropertiesData, insertOrder FROM EventView"];
      unint64_t v5 = [v3 executeSelectQuery:v4 forTable:self withParameters:&__NSArray0__struct];

      goto LABEL_8;
    }
  }
  else
  {
    v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v10 = (id)objc_opt_class();
      id v7 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", buf, 0xCu);
    }
  }
  unint64_t v5 = 0;
LABEL_8:

  return v5;
}

- (id)allEventsForHandle:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(APDBEvent *)self manager];
  if (!v5)
  {
    v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v14 = (id)objc_opt_class();
      id v10 = v14;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", buf, 0xCu);
    }
    id v9 = 0;
    goto LABEL_7;
  }
  if ([(APDBEvent *)self createEventViewIfNeeded])
  {
    v6 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"handle" forColumnType:3 withValue:v4];
    id v7 = +[NSString stringWithFormat:@"%@ WHERE handle = ? ORDER BY insertOrder ASC", @"SELECT handle, timestamp, purpose, event, source, unknownSource, handleSet, eventOrder, trace, branchString, environmentString, impression, propertiesData, internalPropertiesData, insertOrder FROM EventView"];
    id v12 = v6;
    v8 = +[NSArray arrayWithObjects:&v12 count:1];
    id v9 = [v5 executeSelectQuery:v7 forTable:self withParameters:v8];

LABEL_7:
    goto LABEL_9;
  }
  id v9 = 0;
LABEL_9:

  return v9;
}

- (id)impressionEventsForHandle:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(APDBEvent *)self manager];
  if (!v5)
  {
    v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v14 = (id)objc_opt_class();
      id v10 = v14;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", buf, 0xCu);
    }
    id v9 = 0;
    goto LABEL_7;
  }
  if ([(APDBEvent *)self createEventViewIfNeeded])
  {
    v6 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"handle" forColumnType:3 withValue:v4];
    id v7 = +[NSString stringWithFormat:@"%@ WHERE impression = 1 AND handle = ? ORDER BY insertOrder ASC", @"SELECT handle, timestamp, purpose, event, source, unknownSource, handleSet, eventOrder, trace, branchString, environmentString, impression, propertiesData, internalPropertiesData, insertOrder FROM EventView"];
    id v12 = v6;
    v8 = +[NSArray arrayWithObjects:&v12 count:1];
    id v9 = [v5 executeSelectQuery:v7 forTable:self withParameters:v8];

LABEL_7:
    goto LABEL_9;
  }
  id v9 = 0;
LABEL_9:

  return v9;
}

- (id)interactedEventsForHandle:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(APDBEvent *)self manager];
  if (!v5)
  {
    v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v15 = (id)objc_opt_class();
      id v11 = v15;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", buf, 0xCu);
    }
    id v10 = 0;
    goto LABEL_7;
  }
  if ([(APDBEvent *)self createEventViewIfNeeded])
  {
    v6 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"event" forColumnType:0 withValue:&off_10024A3E8];
    id v7 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"handle" forColumnType:3 withValue:v4];
    v8 = +[NSString stringWithFormat:@"%@ WHERE event = ? AND handle = ? ORDER BY insertOrder ASC", @"SELECT handle, timestamp, purpose, event, source, unknownSource, handleSet, eventOrder, trace, branchString, environmentString, impression, propertiesData, internalPropertiesData, insertOrder FROM EventView"];
    v13[0] = v6;
    v13[1] = v7;
    id v9 = +[NSArray arrayWithObjects:v13 count:2];
    id v10 = [v5 executeSelectQuery:v8 forTable:self withParameters:v9];

LABEL_7:
    goto LABEL_9;
  }
  id v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)dropExpiredEventTables
{
  v3 = [(APDBEvent *)self manager];
  if (v3)
  {
    id v4 = [(APDBEvent *)self _eventViewTableNamesForDay:+[APDBEvent _currentDayOfYear]];
    unint64_t v5 = +[NSSet setWithArray:v4];

    v6 = [v3 executeSelectStringsQuery:@"SELECT name FROM sqlite_master WHERE type='table' AND name LIKE 'event_%'" withParameters:&__NSArray0__struct];
    if (v6)
    {
      id v7 = +[NSMutableSet setWithArray:v6];
      v17 = v5;
      [v7 minusSet:v5];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = v7;
      id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v19;
        int v12 = 1;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            id v14 = +[NSString stringWithFormat:@"DROP TABLE %@", *(void *)(*((void *)&v18 + 1) + 8 * i)];
            v12 &= [v3 executeQueryFromString:v14];
          }
          id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v10);
      }
      else
      {
        LOBYTE(v12) = 1;
      }

      unint64_t v5 = v17;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    unint64_t v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v24 = (id)objc_opt_class();
      id v15 = v24;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", buf, 0xCu);
    }
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (BOOL)createEventViewIfNeeded
{
  v3 = [(APDBEvent *)self createViewLock];
  [v3 lock];
  id v4 = +[APDBEvent _currentDayOfYear];
  if ((void *)[(APDBEvent *)self viewDayOfYear] != v4)
  {
    if (![(APDBEvent *)self _createEventViewForDay:v4])
    {
      BOOL v5 = 0;
      goto LABEL_6;
    }
    [(APDBEvent *)self setViewDayOfYear:v4];
  }
  BOOL v5 = 1;
LABEL_6:
  [v3 unlock];

  return v5;
}

- (BOOL)_createEventTableIfNeeded
{
  v3 = [(APDBEvent *)self createTableLock];
  [v3 lock];
  id v4 = +[APDBEvent _currentDayOfYear];
  if ((void *)[(APDBEvent *)self tableDayOfYear] != v4)
  {
    BOOL v5 = [(APDBEvent *)self manager];
    unsigned int v6 = +[APDBEvent _createEventTableWithManager:v5 dayOfYear:v4];

    if (!v6)
    {
      BOOL v7 = 0;
      goto LABEL_6;
    }
    [(APDBEvent *)self setTableDayOfYear:v4];
  }
  BOOL v7 = 1;
LABEL_6:
  [v3 unlock];

  return v7;
}

- (id)_eventViewTableNamesForDay:(unint64_t)a3
{
  BOOL v5 = [(APDBEvent *)self manager];
  unsigned int v6 = v5;
  if (v5)
  {
    v26 = v5;
    BOOL v7 = [v5 executeSelectStringsQuery:@"SELECT name FROM sqlite_master WHERE type='table' AND name LIKE 'event_%'" withParameters:&__NSArray0__struct];
    id v8 = +[NSSet setWithArray:v7];

    id v9 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSGregorianCalendar];
    id v10 = objc_alloc_init((Class)NSDateComponents);
    uint64_t v11 = +[NSMutableArray array];
    uint64_t v12 = [(APDBEvent *)self _expirationOfData];
    if (v12 >= 1)
    {
      uint64_t v13 = 0;
      uint64_t v14 = 1 - v12;
      do
      {
        id v15 = (id)(a3 + v13);
        if ((uint64_t)(a3 + v13) <= 0)
        {
          [v10 setDay:v13];
          id v16 = +[NSDate date];
          v17 = [v9 dateByAddingComponents:v10 toDate:v16 options:0];

          id v15 = [v9 ordinalityOfUnit:16 inUnit:4 forDate:v17];
        }
        long long v18 = +[NSString stringWithFormat:@"event_%lu", v15];
        if ([v8 containsObject:v18]) {
          [v11 addObject:v18];
        }
        id v19 = [v8 count];
        id v20 = [v11 count];

        if (v19 == v20) {
          break;
        }
      }
      while (v14 != v13--);
    }
    unsigned __int8 v22 = +[NSArray arrayWithArray:v11];

    unsigned int v6 = v26;
  }
  else
  {
    unsigned __int8 v23 = APLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v28 = (id)objc_opt_class();
      id v24 = v28;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", buf, 0xCu);
    }
    unsigned __int8 v22 = &__NSArray0__struct;
  }

  return v22;
}

- (id)_createEventViewQueryForDay:(unint64_t)a3
{
  v3 = [(APDBEvent *)self _eventViewTableNamesForDay:a3];
  if ([v3 count])
  {
    id v4 = +[NSMutableArray array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = +[NSString stringWithFormat:@"SELECT %@ FROM %@", @"handle, timestamp, purpose, event, source, unknownSource, handleSet, eventOrder, trace, branchString, environmentString, impression, propertiesData, internalPropertiesData, insertOrder", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14];
          [v4 addObject:v10];
        }
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    uint64_t v11 = [v4 componentsJoinedByString:@" UNION "];
    uint64_t v12 = +[NSString stringWithFormat:@"CREATE TEMP VIEW IF NOT EXISTS EventView (%@) AS %@", @"handle, timestamp, purpose, event, source, unknownSource, handleSet, eventOrder, trace, branchString, environmentString, impression, propertiesData, internalPropertiesData, insertOrder", v11];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)_createEventViewForDay:(unint64_t)a3
{
  id v5 = [(APDBEvent *)self manager];
  if (!v5)
  {
    id v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138477827;
      id v13 = (id)objc_opt_class();
      id v8 = v13;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_10;
  }
  id v6 = [(APDBEvent *)self _createEventViewQueryForDay:a3];
  if (!v6)
  {
LABEL_10:
    unsigned __int8 v7 = 0;
    goto LABEL_11;
  }
  if (([v5 executeQueryFromString:@"DROP VIEW IF EXISTS EventView"] & 1) == 0)
  {
    id v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138477827;
      id v13 = (id)objc_opt_class();
      id v10 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%{private}@]: Error, could not drop Event View.", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_10;
  }
  unsigned __int8 v7 = [v5 executeQueryFromString:v6];
LABEL_11:

  return v7;
}

- (int64_t)_lastEventInsertOrder
{
  id v2 = [(APDBEvent *)self manager];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 executeSelectNumberQuery:@"SELECT insertOrder FROM EventView ORDER BY insertOrder DESC LIMIT 1" withParameters:&__NSArray0__struct];
    id v5 = v4;
    if (v4) {
      id v6 = [v4 integerValue];
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    unsigned __int8 v7 = APLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138477827;
      id v11 = (id)objc_opt_class();
      id v8 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", (uint8_t *)&v10, 0xCu);
    }
    id v6 = 0;
  }

  return (int64_t)v6;
}

- (int64_t)_expirationOfData
{
  id v2 = +[APConfigurationMediator configurationForClass:objc_opt_class()];
  v3 = [v2 expirationOfData];

  if (v3)
  {
    id v4 = [v2 expirationOfData];
    int64_t v5 = (int64_t)[v4 integerValue];
  }
  else
  {
    int64_t v5 = 30;
  }

  return v5;
}

- (unint64_t)tableDayOfYear
{
  return self->_tableDayOfYear;
}

- (void)setTableDayOfYear:(unint64_t)a3
{
  self->_tableDayOfYear = a3;
}

- (unint64_t)viewDayOfYear
{
  return self->_viewDayOfYear;
}

- (void)setViewDayOfYear:(unint64_t)a3
{
  self->_viewDayOfYear = a3;
}

- (int64_t)insertOrder
{
  return self->_insertOrder;
}

- (void)setInsertOrder:(int64_t)a3
{
  self->_insertOrder = a3;
}

- (APUnfairLock)createTableLock
{
  return self->_createTableLock;
}

- (void)setCreateTableLock:(id)a3
{
}

- (APUnfairLock)createViewLock
{
  return self->_createViewLock;
}

- (void)setCreateViewLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createViewLock, 0);

  objc_storeStrong((id *)&self->_createTableLock, 0);
}

@end