@interface MOFSM(Trip)
- (id)description;
@end

@implementation MOFSM(Trip)

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v19 = NSStringFromClass(v3);
  v24 = [(MOFSM *)self name];
  v17 = [v24 mask];
  v23 = [(MOFSM *)self referenceState];
  v25 = [v23 mask];
  v22 = [(MOFSM *)self referenceStateCode];
  v16 = [v22 mask];
  v21 = [(MOFSM *)self referenceCountry];
  v13 = [v21 mask];
  v18 = [(MOFSM *)self referenceCountryCode];
  v12 = [v18 mask];
  unint64_t v14 = [(MOFSM *)self mode];
  v4 = [(MOFSM *)self stringFromState:[(MOFSM *)self state]];
  v15 = [(MOFSM *)self substate];
  v5 = [v15 mask];
  v6 = [(MOFSM *)self destination];
  v7 = [v6 mask];
  v8 = [(MOFSM *)self timeRangeStartDate];
  v9 = [(MOFSM *)self timeRangeEndDate];
  v10 = [(MOFSM *)self lastProcessedDate];
  v20 = +[NSString stringWithFormat:@"%@: name, %@, state, %@(%@), country, %@(%@), mode, %lu, state, %@, subState, %@, destination, %@, startDate, %@, endDate, %@, timestamp, %@", v19, v17, v25, v16, v13, v12, v14, v4, v5, v7, v8, v9, v10];

  return v20;
}

@end