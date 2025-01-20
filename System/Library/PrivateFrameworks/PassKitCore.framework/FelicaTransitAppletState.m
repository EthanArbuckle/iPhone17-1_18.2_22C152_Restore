@interface FelicaTransitAppletState
+ (id)_predicateForPaymentApplicationPID:(int64_t)a3;
+ (id)_propertySetters;
+ (id)anyInDatabase:(id)a3 withPaymentApplicationPID:(int64_t)a4;
+ (id)databaseTable;
+ (id)felicaTransitAppletStateInDatabase:(id)a3 withPassUniqueIdentifier:(id)a4 secureElementIdentifier:(id)a5 paymentApplicationIdentifier:(id)a6;
+ (id)insertFelicaTransitAppletState:(id)a3 forPaymentApplicationPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPaymentApplicationPID:(int64_t)a3 inDatabase:(id)a4;
- (FelicaTransitAppletState)initWithFelicaTransitAppletState:(id)a3 forPaymentApplicationPID:(unint64_t)a4 inDatabase:(id)a5;
- (id)_valuesDictionaryForAppletState:(id)a3;
- (id)paymentTransactionIdentifier;
- (id)transitAppletState;
- (void)setPaymentTransactionIdentifier:(id)a3;
- (void)updateWithAppletState:(id)a3;
@end

@implementation FelicaTransitAppletState

+ (id)databaseTable
{
  return @"felica_transit_applet_state";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if ([v6 isEqualToString:@"payment_application.pid"]) {
    [v5 addObject:@"JOIN payment_application ON felica_transit_applet_state.payment_application_pid = payment_application.pid"];
  }
  if ([v6 isEqualToString:@"pass.pid"]) {
    [v5 addObject:@"JOIN pass ON pass.pid = payment_application.pass_pid"];
  }
}

+ (id)anyInDatabase:(id)a3 withPaymentApplicationPID:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPaymentApplicationPID:a4];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)_predicateForPaymentApplicationPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_application_pid" equalToValue:v3];

  return v4;
}

+ (id)insertFelicaTransitAppletState:(id)a3 forPaymentApplicationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithFelicaTransitAppletState:v9 forPaymentApplicationPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteEntitiesForPaymentApplicationPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPaymentApplicationPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)felicaTransitAppletStateInDatabase:(id)a3 withPassUniqueIdentifier:(id)a4 secureElementIdentifier:(id)a5 paymentApplicationIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = objc_alloc_init((Class)NSMutableSet);
  v15 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass.unique_id" equalToValue:v13];

  v16 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_application.seid" equalToValue:v12];

  v17 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_application.aid" equalToValue:v11];

  v32[0] = v15;
  v32[1] = v16;
  v32[2] = v17;
  v18 = +[NSArray arrayWithObjects:v32 count:3];
  v19 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v18];
  v20 = +[SQLiteEntity queryWithDatabase:v10 predicate:v19];

  v31[0] = @"payment_application.pid";
  v31[1] = @"pass.pid";
  v21 = +[NSArray arrayWithObjects:v31 count:2];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1002D43AC;
  v27[3] = &unk_10072EAD8;
  id v30 = a1;
  id v28 = v10;
  id v22 = v14;
  id v29 = v22;
  id v23 = v10;
  [v20 enumeratePersistentIDsAndProperties:v21 usingBlock:v27];

  v24 = v29;
  id v25 = v22;

  return v25;
}

- (FelicaTransitAppletState)initWithFelicaTransitAppletState:(id)a3 forPaymentApplicationPID:(unint64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = [(FelicaTransitAppletState *)self _valuesDictionaryForAppletState:a3];
  id v10 = +[NSNumber numberWithUnsignedLongLong:a4];
  [v9 setObject:v10 forKeyedSubscript:@"payment_application_pid"];

  id v11 = [(SQLiteEntity *)self initWithPropertyValues:v9 inDatabase:v8];
  return v11;
}

- (void)updateWithAppletState:(id)a3
{
  id v4 = [(FelicaTransitAppletState *)self _valuesDictionaryForAppletState:a3];
  [(SQLiteEntity *)self setValuesWithDictionary:v4];
}

- (id)_valuesDictionaryForAppletState:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = +[NSNull null];
  id v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isBlacklisted]);
  [v4 setObject:v6 forKeyedSubscript:@"blacklisted"];

  uint64_t v7 = [v3 historySequenceNumber];
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = v5;
  }
  [v4 setObject:v9 forKeyedSubscript:@"history_sequence_number"];

  id v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isShinkansenTicketActive]);
  [v4 setObject:v10 forKeyedSubscript:@"shinkansen_ticket_active"];

  id v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isBalanceAllowedForCommute]);
  [v4 setObject:v11 forKeyedSubscript:@"balance_allowed_for_commute"];

  id v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isLowBalanceNotificationEnabled]);
  [v4 setObject:v12 forKeyedSubscript:@"low_balance_notification_enabled"];

  id v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isGreenCarTicketUsed]);
  [v4 setObject:v13 forKeyedSubscript:@"green_car_ticket_used"];

  id v14 = [v3 balance];
  if (v14)
  {
    v15 = [v3 balance];
    v16 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v15 unsignedLongLongValue]);
    [v4 setObject:v16 forKeyedSubscript:@"balance"];
  }
  else
  {
    [v4 setObject:v5 forKeyedSubscript:@"balance"];
  }

  uint64_t v17 = [v3 shinkansenValidityStartDate];
  v18 = (void *)v17;
  if (v17) {
    v19 = (void *)v17;
  }
  else {
    v19 = v5;
  }
  [v4 setObject:v19 forKeyedSubscript:@"shinkansen_validity_start_date"];

  uint64_t v20 = [v3 shinkansenValidityTerm];
  v21 = (void *)v20;
  if (v20) {
    id v22 = (void *)v20;
  }
  else {
    id v22 = v5;
  }
  [v4 setObject:v22 forKeyedSubscript:@"shinkansen_validity_term"];

  uint64_t v23 = [v3 shinkansenOriginStationCode];
  v24 = (void *)v23;
  if (v23) {
    id v25 = (void *)v23;
  }
  else {
    id v25 = v5;
  }
  [v4 setObject:v25 forKeyedSubscript:@"shinkansen_origin_station_code"];

  uint64_t v26 = [v3 shinkansenDestinationStationCode];
  v27 = (void *)v26;
  if (v26) {
    id v28 = (void *)v26;
  }
  else {
    id v28 = v5;
  }
  [v4 setObject:v28 forKeyedSubscript:@"shinkansen_destination_station_code"];

  uint64_t v29 = [v3 shinkansenOriginStationString];
  id v30 = (void *)v29;
  if (v29) {
    v31 = (void *)v29;
  }
  else {
    v31 = v5;
  }
  [v4 setObject:v31 forKeyedSubscript:@"shinkansen_origin_station_string"];

  uint64_t v32 = [v3 shinkansenDestinationStationString];
  v33 = (void *)v32;
  if (v32) {
    v34 = (void *)v32;
  }
  else {
    v34 = v5;
  }
  [v4 setObject:v34 forKeyedSubscript:@"shinkansen_destination_station_string"];

  uint64_t v35 = [v3 shinkansenDepartureTime];
  v36 = (void *)v35;
  if (v35) {
    v37 = (void *)v35;
  }
  else {
    v37 = v5;
  }
  [v4 setObject:v37 forKeyedSubscript:@"shinkansen_departure_time"];

  uint64_t v38 = [v3 shinkansenArrivalTime];
  v39 = (void *)v38;
  if (v38) {
    v40 = (void *)v38;
  }
  else {
    v40 = v5;
  }
  [v4 setObject:v40 forKeyedSubscript:@"shinkansen_arrival_time"];

  uint64_t v41 = [v3 shinkansenTrainName];
  v42 = (void *)v41;
  if (v41) {
    v43 = (void *)v41;
  }
  else {
    v43 = v5;
  }
  [v4 setObject:v43 forKeyedSubscript:@"shinkansen_train_name"];

  uint64_t v44 = [v3 shinkansenCarNumber];
  v45 = (void *)v44;
  if (v44) {
    v46 = (void *)v44;
  }
  else {
    v46 = v5;
  }
  [v4 setObject:v46 forKeyedSubscript:@"shinkansen_car_number"];

  uint64_t v47 = [v3 shinkansenSeatRow];
  v48 = (void *)v47;
  if (v47) {
    v49 = (void *)v47;
  }
  else {
    v49 = v5;
  }
  [v4 setObject:v49 forKeyedSubscript:@"shinkansen_seat_row"];

  uint64_t v50 = [v3 shinkansenSeatNumber];
  v51 = (void *)v50;
  if (v50) {
    v52 = (void *)v50;
  }
  else {
    v52 = v5;
  }
  [v4 setObject:v52 forKeyedSubscript:@"shinkansen_seat_number"];

  uint64_t v53 = [v3 shinkansenSecondaryOriginStationCode];
  v54 = (void *)v53;
  if (v53) {
    v55 = (void *)v53;
  }
  else {
    v55 = v5;
  }
  [v4 setObject:v55 forKeyedSubscript:@"shinkansen_secondary_origin_station_code"];

  uint64_t v56 = [v3 shinkansenSecondaryDestinationStationCode];
  v57 = (void *)v56;
  if (v56) {
    v58 = (void *)v56;
  }
  else {
    v58 = v5;
  }
  [v4 setObject:v58 forKeyedSubscript:@"shinkansen_secondary_destination_station_code"];

  uint64_t v59 = [v3 shinkansenSecondaryOriginStationString];
  v60 = (void *)v59;
  if (v59) {
    v61 = (void *)v59;
  }
  else {
    v61 = v5;
  }
  [v4 setObject:v61 forKeyedSubscript:@"shinkansen_secondary_origin_station_string"];

  uint64_t v62 = [v3 shinkansenSecondaryDestinationStationString];
  v63 = (void *)v62;
  if (v62) {
    v64 = (void *)v62;
  }
  else {
    v64 = v5;
  }
  [v4 setObject:v64 forKeyedSubscript:@"shinkansen_secondary_destination_station_string"];

  uint64_t v65 = [v3 shinkansenSecondaryDepartureTime];
  v66 = (void *)v65;
  if (v65) {
    v67 = (void *)v65;
  }
  else {
    v67 = v5;
  }
  [v4 setObject:v67 forKeyedSubscript:@"shinkansen_secondary_departure_time"];

  uint64_t v68 = [v3 shinkansenSecondaryArrivalTime];
  v69 = (void *)v68;
  if (v68) {
    v70 = (void *)v68;
  }
  else {
    v70 = v5;
  }
  [v4 setObject:v70 forKeyedSubscript:@"shinkansen_secondary_arrival_time"];

  uint64_t v71 = [v3 shinkansenSecondaryTrainName];
  v72 = (void *)v71;
  if (v71) {
    v73 = (void *)v71;
  }
  else {
    v73 = v5;
  }
  [v4 setObject:v73 forKeyedSubscript:@"shinkansen_secondary_train_name"];

  uint64_t v74 = [v3 shinkansenSecondaryCarNumber];
  v75 = (void *)v74;
  if (v74) {
    v76 = (void *)v74;
  }
  else {
    v76 = v5;
  }
  [v4 setObject:v76 forKeyedSubscript:@"shinkansen_secondary_car_number"];

  uint64_t v77 = [v3 shinkansenSecondarySeatRow];
  v78 = (void *)v77;
  if (v77) {
    v79 = (void *)v77;
  }
  else {
    v79 = v5;
  }
  [v4 setObject:v79 forKeyedSubscript:@"shinkansen_secondary_seat_row"];

  uint64_t v80 = [v3 shinkansenSecondarySeatNumber];
  v81 = (void *)v80;
  if (v80) {
    v82 = (void *)v80;
  }
  else {
    v82 = v5;
  }
  [v4 setObject:v82 forKeyedSubscript:@"shinkansen_secondary_seat_number"];

  uint64_t v83 = [v3 greenCarOriginStationCode];
  v84 = (void *)v83;
  if (v83) {
    v85 = (void *)v83;
  }
  else {
    v85 = v5;
  }
  [v4 setObject:v85 forKeyedSubscript:@"green_car_origin_station_code"];

  uint64_t v86 = [v3 greenCarDestinationStationCode];
  v87 = (void *)v86;
  if (v86) {
    v88 = (void *)v86;
  }
  else {
    v88 = v5;
  }
  [v4 setObject:v88 forKeyedSubscript:@"green_car_destination_station_code"];

  uint64_t v89 = [v3 greenCarOriginStationString];
  v90 = (void *)v89;
  if (v89) {
    v91 = (void *)v89;
  }
  else {
    v91 = v5;
  }
  [v4 setObject:v91 forKeyedSubscript:@"green_car_origin_station_string"];

  uint64_t v92 = [v3 greenCarDestinationStationString];
  v93 = (void *)v92;
  if (v92) {
    v94 = (void *)v92;
  }
  else {
    v94 = v5;
  }
  [v4 setObject:v94 forKeyedSubscript:@"green_car_destination_station_string"];

  uint64_t v95 = [v3 greenCarValidityStartDate];
  v96 = (void *)v95;
  if (v95) {
    v97 = (void *)v95;
  }
  else {
    v97 = v5;
  }
  [v4 setObject:v97 forKeyedSubscript:@"green_car_validity_start_date"];

  v98 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 hasGreenCarTicket]);
  [v4 setObject:v98 forKeyedSubscript:@"has_green_car_ticket"];

  v99 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 hasShinkansenTicket]);
  [v4 setObject:v99 forKeyedSubscript:@"has_shinkansen_ticket"];

  v100 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 needsStationProcessing]);
  [v4 setObject:v100 forKeyedSubscript:@"needs_station_processing"];

  v101 = [v3 enrouteTransitTypes];
  if (v101)
  {
    v102 = +[NSKeyedArchiver archivedDataWithRootObject:v101 requiringSecureCoding:1 error:0];
  }
  else
  {
    v102 = 0;
  }
  if (v102) {
    v103 = v102;
  }
  else {
    v103 = v5;
  }
  [v4 setObject:v103 forKeyedSubscript:@"en_route_flags"];

  return v4;
}

- (id)paymentTransactionIdentifier
{
  return [(SQLiteEntity *)self valueForProperty:@"payment_transaction_identifier"];
}

- (void)setPaymentTransactionIdentifier:(id)a3
{
  if (a3)
  {
    -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:");
  }
  else
  {
    id v4 = +[NSNull null];
    [(SQLiteEntity *)self setValue:v4 forProperty:@"payment_transaction_identifier"];
  }
}

+ (id)_propertySetters
{
  v4[0] = @"shinkansen_ticket_active";
  v4[1] = @"balance_allowed_for_commute";
  v5[0] = &stru_100746A98;
  v5[1] = &stru_100746AB8;
  v4[2] = @"low_balance_notification_enabled";
  v4[3] = @"green_car_ticket_used";
  v5[2] = &stru_100746AD8;
  v5[3] = &stru_100746AF8;
  v4[4] = @"history_sequence_number";
  v4[5] = @"balance";
  v5[4] = &stru_100746B18;
  v5[5] = &stru_100746B38;
  v4[6] = @"blacklisted";
  v4[7] = @"shinkansen_validity_start_date";
  v5[6] = &stru_100746B58;
  v5[7] = &stru_100746B78;
  v4[8] = @"shinkansen_validity_term";
  v4[9] = @"shinkansen_origin_station_code";
  v5[8] = &stru_100746B98;
  v5[9] = &stru_100746BB8;
  v4[10] = @"shinkansen_origin_station_string";
  v4[11] = @"shinkansen_destination_station_code";
  v5[10] = &stru_100746BD8;
  v5[11] = &stru_100746BF8;
  v4[12] = @"shinkansen_destination_station_string";
  v4[13] = @"shinkansen_departure_time";
  v5[12] = &stru_100746C18;
  v5[13] = &stru_100746C38;
  v4[14] = @"shinkansen_arrival_time";
  v4[15] = @"shinkansen_train_name";
  v5[14] = &stru_100746C58;
  v5[15] = &stru_100746C78;
  v4[16] = @"shinkansen_car_number";
  v4[17] = @"shinkansen_seat_row";
  v5[16] = &stru_100746C98;
  v5[17] = &stru_100746CB8;
  v4[18] = @"shinkansen_seat_number";
  v4[19] = @"shinkansen_secondary_origin_station_code";
  v5[18] = &stru_100746CD8;
  v5[19] = &stru_100746CF8;
  v4[20] = @"shinkansen_secondary_origin_station_string";
  v4[21] = @"shinkansen_secondary_destination_station_code";
  v5[20] = &stru_100746D18;
  v5[21] = &stru_100746D38;
  v4[22] = @"shinkansen_secondary_destination_station_string";
  v4[23] = @"shinkansen_secondary_departure_time";
  v5[22] = &stru_100746D58;
  v5[23] = &stru_100746D78;
  v4[24] = @"shinkansen_secondary_arrival_time";
  v4[25] = @"shinkansen_secondary_train_name";
  v5[24] = &stru_100746D98;
  v5[25] = &stru_100746DB8;
  v4[26] = @"shinkansen_secondary_car_number";
  v4[27] = @"shinkansen_secondary_seat_row";
  v5[26] = &stru_100746DD8;
  v5[27] = &stru_100746DF8;
  v4[28] = @"shinkansen_secondary_seat_number";
  v4[29] = @"green_car_origin_station_code";
  v5[28] = &stru_100746E18;
  v5[29] = &stru_100746E38;
  v4[30] = @"green_car_destination_station_code";
  v4[31] = @"green_car_origin_station_string";
  v5[30] = &stru_100746E58;
  v5[31] = &stru_100746E78;
  v4[32] = @"green_car_destination_station_string";
  v4[33] = @"green_car_validity_start_date";
  v5[32] = &stru_100746E98;
  v5[33] = &stru_100746EB8;
  v4[34] = @"has_green_car_ticket";
  v4[35] = @"has_shinkansen_ticket";
  v5[34] = &stru_100746ED8;
  v5[35] = &stru_100746EF8;
  v4[36] = @"needs_station_processing";
  v4[37] = @"en_route_flags";
  v5[36] = &stru_100746F18;
  v5[37] = &stru_100746F38;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:38];
  return v2;
}

- (id)transitAppletState
{
  id v3 = objc_alloc_init((Class)PKFelicaTransitAppletState);
  id v4 = +[FelicaTransitAppletState _propertySetters];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002D5740;
  v11[3] = &unk_10072EDD0;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

@end