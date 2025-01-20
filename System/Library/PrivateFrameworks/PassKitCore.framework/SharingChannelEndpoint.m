@interface SharingChannelEndpoint
+ (BOOL)deleteEndpoint:(id)a3 inDatabase:(id)a4;
+ (BOOL)deleteEndpointForTransportIdentifier:(id)a3 inDatabase:(id)a4;
+ (BOOL)insert:(id)a3 inDatabase:(id)a4;
+ (id)_endpointForProperties:(id)a3 values:(const void *)a4;
+ (id)_predicateForHasOutstandingMessages;
+ (id)_predicateForSharingTransportIdentifier:(id)a3;
+ (id)_predicateForType:(unint64_t)a3;
+ (id)_properties;
+ (id)_propertySettersForIDSChannelEndpoint;
+ (id)_propertySettersForLocalOnDeviceChannelEndpoint;
+ (id)_propertySettersForRelayChannelEndpoint;
+ (id)databaseTable;
+ (id)endpointsInDatabase:(id)a3;
+ (id)endpointsInDatabase:(id)a3 ofType:(unint64_t)a4;
+ (id)endpointsWithOutstandingMessagesInDatabase:(id)a3;
+ (id)sharingEndpointForTransportIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
- (BOOL)deleteFromDatabase;
- (SharingChannelEndpoint)initWithSharingChannelEndpoint:(id)a3 inDatabase:(id)a4;
- (id)idsChannelEndpoint;
- (id)localOnDeviceChannelEndpoint;
- (id)relayChannelEndpoint;
@end

@implementation SharingChannelEndpoint

- (SharingChannelEndpoint)initWithSharingChannelEndpoint:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100020B7C;
  v22 = sub_1000210B0;
  id v23 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10031FF98;
  v13[3] = &unk_10073ADD8;
  id v8 = v6;
  id v14 = v8;
  id v9 = v7;
  id v15 = v9;
  v17 = &v18;
  v10 = self;
  v16 = v10;
  sub_10000817C((uint64_t)v9, v13);
  v11 = (SharingChannelEndpoint *)(id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

+ (id)databaseTable
{
  return @"jabuticaba";
}

- (BOOL)deleteFromDatabase
{
  v3 = [(SharingChannelEndpoint *)self relayChannelEndpoint];
  [v3 deleteFromDatabase];

  v4 = [(SharingChannelEndpoint *)self idsChannelEndpoint];
  [v4 deleteFromDatabase];

  v5 = [(SharingChannelEndpoint *)self localOnDeviceChannelEndpoint];
  [v5 deleteFromDatabase];

  v7.receiver = self;
  v7.super_class = (Class)SharingChannelEndpoint;
  return [(SQLiteEntity *)&v7 deleteFromDatabase];
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (([v6 isEqualToString:@"mangosteen.ra"] & 1) != 0
    || ([v6 isEqualToString:@"mangosteen.rb"] & 1) != 0
    || ([v6 isEqualToString:@"mangosteen.rc"] & 1) != 0
    || ([v6 isEqualToString:@"mangosteen.rd"] & 1) != 0
    || ([v6 isEqualToString:@"mangosteen.rf"] & 1) != 0
    || ([v6 isEqualToString:@"mangosteen.rg"] & 1) != 0
    || ([v6 isEqualToString:@"mangosteen.rh"] & 1) != 0
    || [v6 isEqualToString:@"mangosteen.ri"])
  {
    [v5 addObject:@"LEFT JOIN mangosteen ON jabuticaba.a = mangosteen.pid"];
  }
  if (([v6 isEqualToString:@"breakfast_burrito.ia"] & 1) != 0
    || ([v6 isEqualToString:@"breakfast_burrito.ib"] & 1) != 0
    || [v6 isEqualToString:@"breakfast_burrito.ic"])
  {
    [v5 addObject:@"LEFT JOIN breakfast_burrito ON jabuticaba.a = breakfast_burrito.pid"];
  }
  if (([v6 isEqualToString:@"green_eggs_ham.la"] & 1) != 0
    || [v6 isEqualToString:@"green_eggs_ham.lb"])
  {
    [v5 addObject:@"LEFT JOIN green_eggs_ham ON jabuticaba.a = green_eggs_ham.pid"];
  }
}

+ (BOOL)insert:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [a1 deleteEndpoint:v7 inDatabase:v6];
  id v8 = [[SharingChannelEndpoint alloc] initWithSharingChannelEndpoint:v7 inDatabase:v6];

  return v8 != 0;
}

+ (id)sharingEndpointForTransportIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SharingChannelEndpoint _predicateForSharingTransportIdentifier:v6];
  id v9 = +[SQLiteEntity queryWithDatabase:v7 predicate:v8 orderingProperties:0 orderingDirections:0 limit:1];

  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_100020B7C;
  uint64_t v18 = sub_1000210B0;
  id v19 = 0;
  v10 = [a1 _properties];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003205BC;
  v13[3] = &unk_1007492B0;
  void v13[4] = &v14;
  v13[5] = a1;
  [v9 enumerateProperties:v10 usingBlock:v13];

  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

+ (id)endpointsInDatabase:(id)a3
{
  v4 = +[SQLiteEntity queryWithDatabase:a3 predicate:0];
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [a1 _properties];
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_100320708;
  uint64_t v14 = &unk_1007492D8;
  id v15 = v5;
  id v16 = a1;
  id v7 = v5;
  [v4 enumerateProperties:v6 usingBlock:&v11];

  if (objc_msgSend(v7, "count", v11, v12, v13, v14)) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  return v9;
}

+ (id)endpointsInDatabase:(id)a3 ofType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForType:a4];
  id v8 = +[SQLiteEntity queryWithDatabase:v6 predicate:v7];

  id v9 = objc_alloc_init((Class)NSMutableArray);
  v10 = [a1 _properties];
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_100320894;
  uint64_t v18 = &unk_1007492D8;
  id v19 = v9;
  id v20 = a1;
  id v11 = v9;
  [v8 enumerateProperties:v10 usingBlock:&v15];

  if (objc_msgSend(v11, "count", v15, v16, v17, v18)) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  return v13;
}

+ (id)endpointsWithOutstandingMessagesInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _predicateForHasOutstandingMessages];
  id v6 = +[SQLiteEntity queryWithDatabase:v4 predicate:v5];

  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = [a1 _properties];
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_100320A10;
  uint64_t v16 = &unk_1007492D8;
  id v17 = v7;
  id v18 = a1;
  id v9 = v7;
  [v6 enumerateProperties:v8 usingBlock:&v13];

  if (objc_msgSend(v9, "count", v13, v14, v15, v16)) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  return v11;
}

+ (id)_endpointForProperties:(id)a3 values:(const void *)a4
{
  id v6 = a3;
  uint64_t v7 = sub_100320B64((void *)a4[2]);
  switch(v7)
  {
    case 3:
      id v8 = objc_alloc_init(PDSharingLocalOnDeviceEndpoint);
      uint64_t v9 = [a1 _propertySettersForLocalOnDeviceChannelEndpoint];
      goto LABEL_7;
    case 2:
      id v8 = objc_alloc_init(PDSharingIDSEndpoint);
      uint64_t v9 = [a1 _propertySettersForIDSChannelEndpoint];
      goto LABEL_7;
    case 1:
      id v8 = objc_alloc_init(PDSharingRelayServerEndpoint);
      uint64_t v9 = [a1 _propertySettersForRelayChannelEndpoint];
LABEL_7:
      v10 = (void *)v9;
      [a1 applyPropertySetters:v9 toObject:v8 withProperties:v6 values:a4];

      goto LABEL_9;
  }
  id v8 = 0;
LABEL_9:

  return v8;
}

+ (BOOL)deleteEndpoint:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 transportIdentifier];
  LOBYTE(a1) = [a1 deleteEndpointForTransportIdentifier:v7 inDatabase:v6];

  return (char)a1;
}

+ (BOOL)deleteEndpointForTransportIdentifier:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[SharingChannelEndpoint _predicateForSharingTransportIdentifier:v5];
  id v8 = +[SQLiteEntity queryWithDatabase:v6 predicate:v7 orderingProperties:0 orderingDirections:0 limit:1];

  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100320DF0;
  v11[3] = &unk_100749300;
  id v9 = v6;
  id v12 = v9;
  id v13 = &v14;
  [v8 enumeratePersistentIDsUsingBlock:v11];
  LOBYTE(v7) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)v7;
}

- (id)relayChannelEndpoint
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"b"];
  uint64_t v4 = sub_100320B64(v3);

  if (v4 == 1)
  {
    id v5 = [(SQLiteEntity *)self valueForProperty:@"a"];
    if (v5) {
      id v6 = -[SQLiteEntity initWithPersistentID:inDatabase:]([SharingRelayChannelEndpoint alloc], "initWithPersistentID:inDatabase:", [v5 longLongValue], self->super._database);
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)idsChannelEndpoint
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"b"];
  uint64_t v4 = sub_100320B64(v3);

  if (v4 == 2)
  {
    id v5 = [(SQLiteEntity *)self valueForProperty:@"a"];
    if (v5) {
      id v6 = -[SQLiteEntity initWithPersistentID:inDatabase:]([SharingIDSChannelEndpoint alloc], "initWithPersistentID:inDatabase:", [v5 longLongValue], self->super._database);
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)localOnDeviceChannelEndpoint
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"b"];
  uint64_t v4 = sub_100320B64(v3);

  if (v4 == 3)
  {
    id v5 = [(SQLiteEntity *)self valueForProperty:@"a"];
    if (v5) {
      id v6 = -[SQLiteEntity initWithPersistentID:inDatabase:]([SharingLocalOnDeviceChannelEndpoint alloc], "initWithPersistentID:inDatabase:", [v5 longLongValue], self->super._database);
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (id)_predicateForSharingTransportIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"identifier" equalToValue:a3];
}

+ (id)_predicateForType:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    CFStringRef v3 = @"unknown";
  }
  else {
    CFStringRef v3 = *(&off_100749700 + a3 - 1);
  }
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:v3];
}

+ (id)_predicateForHasOutstandingMessages
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"mangosteen.rd" equalToValue:&__kCFBooleanTrue];
}

+ (id)_properties
{
  v4[0] = @"a";
  v4[1] = @"identifier";
  v4[2] = @"b";
  v4[3] = @"c";
  v4[4] = @"d";
  v4[5] = @"e";
  v4[6] = @"mangosteen.ra";
  v4[7] = @"mangosteen.rb";
  v4[8] = @"mangosteen.rc";
  v4[9] = @"mangosteen.rd";
  v4[10] = @"mangosteen.rf";
  v4[11] = @"mangosteen.rg";
  v4[12] = @"mangosteen.rh";
  v4[13] = @"mangosteen.ri";
  v4[14] = @"breakfast_burrito.ia";
  v4[15] = @"breakfast_burrito.ib";
  v4[16] = @"breakfast_burrito.ic";
  v4[17] = @"green_eggs_ham.la";
  v4[18] = @"green_eggs_ham.lb";
  v2 = +[NSArray arrayWithObjects:v4 count:19];
  return v2;
}

+ (id)_propertySettersForRelayChannelEndpoint
{
  v4[0] = @"identifier";
  v4[1] = @"b";
  v5[0] = &stru_100749340;
  v5[1] = &stru_100749360;
  v4[2] = @"c";
  v4[3] = @"d";
  v5[2] = &stru_100749380;
  v5[3] = &stru_1007493A0;
  v4[4] = @"e";
  v4[5] = @"mangosteen.ra";
  v5[4] = &stru_1007493C0;
  v5[5] = &stru_1007493E0;
  v4[6] = @"mangosteen.rb";
  v4[7] = @"mangosteen.rc";
  v5[6] = &stru_100749400;
  v5[7] = &stru_100749420;
  v4[8] = @"mangosteen.rd";
  v4[9] = @"mangosteen.rf";
  v5[8] = &stru_100749440;
  v5[9] = &stru_100749460;
  v4[10] = @"mangosteen.rg";
  v4[11] = @"mangosteen.rh";
  v5[10] = &stru_100749480;
  v5[11] = &stru_1007494A0;
  v4[12] = @"mangosteen.ri";
  v5[12] = &stru_1007494C0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:13];
  return v2;
}

+ (id)_propertySettersForIDSChannelEndpoint
{
  v4[0] = @"identifier";
  v4[1] = @"b";
  v5[0] = &stru_100749500;
  v5[1] = &stru_100749520;
  v4[2] = @"c";
  v4[3] = @"d";
  v5[2] = &stru_100749540;
  v5[3] = &stru_100749560;
  v4[4] = @"e";
  v4[5] = @"breakfast_burrito.ia";
  v5[4] = &stru_100749580;
  v5[5] = &stru_1007495A0;
  v4[6] = @"breakfast_burrito.ib";
  v4[7] = @"breakfast_burrito.ic";
  v5[6] = &stru_1007495C0;
  v5[7] = &stru_1007495E0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:8];
  return v2;
}

+ (id)_propertySettersForLocalOnDeviceChannelEndpoint
{
  v4[0] = @"identifier";
  v4[1] = @"b";
  v5[0] = &stru_100749620;
  v5[1] = &stru_100749640;
  v4[2] = @"c";
  v4[3] = @"d";
  v5[2] = &stru_100749660;
  v5[3] = &stru_100749680;
  v4[4] = @"e";
  v4[5] = @"green_eggs_ham.la";
  v5[4] = &stru_1007496A0;
  v5[5] = &stru_1007496C0;
  v4[6] = @"green_eggs_ham.lb";
  v5[6] = &stru_1007496E0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
  return v2;
}

@end