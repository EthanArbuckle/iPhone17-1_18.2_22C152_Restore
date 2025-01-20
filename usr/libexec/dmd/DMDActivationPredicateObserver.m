@interface DMDActivationPredicateObserver
- (BOOL)lastPredicateEvaluationValue;
- (DMDActivationPredicateObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 predicate:(id)a5;
- (DMDActivationPredicateObserverDelegate)delegate;
- (NSString)predicateType;
- (NSString)uniqueIdentifier;
- (id)calendarForIdentifier:(id)a3;
- (id)evaluatePredicateWithError:(id *)a3;
- (id)metadata;
- (void)invalidate;
- (void)reportActivationPredicateObserverDidTrigger;
- (void)setDelegate:(id)a3;
- (void)setLastPredicateEvaluationValue:(BOOL)a3;
@end

@implementation DMDActivationPredicateObserver

- (DMDActivationPredicateObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 predicate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DMDActivationPredicateObserver;
  v11 = [(DMDActivationPredicateObserver *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    v12->_lastPredicateEvaluationValue = 0;
    v13 = [v10 payloadType];
    v14 = (NSString *)[v13 copy];
    predicateType = v12->_predicateType;
    v12->_predicateType = v14;

    v16 = (NSString *)[v9 copy];
    uniqueIdentifier = v12->_uniqueIdentifier;
    v12->_uniqueIdentifier = v16;
  }
  return v12;
}

- (id)evaluatePredicateWithError:(id *)a3
{
  return 0;
}

- (void)invalidate
{
}

- (id)metadata
{
  v8[0] = DMFDeclarationStatePredicateTypeKey;
  v3 = [(DMDActivationPredicateObserver *)self predicateType];
  v9[0] = v3;
  v8[1] = DMFDeclarationStatePredicateLastEvaluationValueKey;
  v4 = +[NSNumber numberWithBool:[(DMDActivationPredicateObserver *)self lastPredicateEvaluationValue]];
  v9[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  id v6 = [v5 mutableCopy];

  return v6;
}

- (void)reportActivationPredicateObserverDidTrigger
{
  v3 = [(DMDActivationPredicateObserver *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000121D8;
    v4[3] = &unk_1000C9BE0;
    id v5 = v3;
    id v6 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  }
}

- (id)calendarForIdentifier:(id)a3
{
  id v3 = a3;
  v4 = NSCalendarIdentifierGregorian;
  if ([v3 isEqualToString:@"buddhist"])
  {
    id v5 = (id *)&NSCalendarIdentifierBuddhist;
  }
  else if ([v3 isEqualToString:@"chinese"])
  {
    id v5 = (id *)&NSCalendarIdentifierChinese;
  }
  else if ([v3 isEqualToString:@"coptic"])
  {
    id v5 = (id *)&NSCalendarIdentifierCoptic;
  }
  else if ([v3 isEqualToString:@"ethiopic-amete-alem"])
  {
    id v5 = (id *)&NSCalendarIdentifierEthiopicAmeteAlem;
  }
  else if ([v3 isEqualToString:@"ethiopic-amete-mihret"])
  {
    id v5 = (id *)&NSCalendarIdentifierEthiopicAmeteMihret;
  }
  else
  {
    if ([v3 isEqualToString:@"gregorian"]) {
      goto LABEL_33;
    }
    if ([v3 isEqualToString:@"hebrew"])
    {
      id v5 = (id *)&NSCalendarIdentifierHebrew;
    }
    else if ([v3 isEqualToString:@"indian"])
    {
      id v5 = (id *)&NSCalendarIdentifierIndian;
    }
    else if ([v3 isEqualToString:@"islamic"])
    {
      id v5 = (id *)&NSCalendarIdentifierIslamic;
    }
    else if ([v3 isEqualToString:@"islamic-civil"])
    {
      id v5 = (id *)&NSCalendarIdentifierIslamicCivil;
    }
    else if ([v3 isEqualToString:@"islamic-tbla"])
    {
      id v5 = (id *)&NSCalendarIdentifierIslamicTabular;
    }
    else if ([v3 isEqualToString:@"islamic-umalqura"])
    {
      id v5 = (id *)&NSCalendarIdentifierIslamicUmmAlQura;
    }
    else if ([v3 isEqualToString:@"iso8601"])
    {
      id v5 = (id *)&NSCalendarIdentifierISO8601;
    }
    else if ([v3 isEqualToString:@"japanese"])
    {
      id v5 = (id *)&NSCalendarIdentifierJapanese;
    }
    else if ([v3 isEqualToString:@"persian"])
    {
      id v5 = (id *)&NSCalendarIdentifierPersian;
    }
    else
    {
      if (![v3 isEqualToString:@"roc"]) {
        goto LABEL_33;
      }
      id v5 = (id *)&NSCalendarIdentifierRepublicOfChina;
    }
  }
  id v6 = (NSString *)*v5;

  v4 = v6;
LABEL_33:
  v7 = +[NSCalendar calendarWithIdentifier:v4];

  return v7;
}

- (DMDActivationPredicateObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DMDActivationPredicateObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)lastPredicateEvaluationValue
{
  return self->_lastPredicateEvaluationValue;
}

- (void)setLastPredicateEvaluationValue:(BOOL)a3
{
  self->_lastPredicateEvaluationValue = a3;
}

- (NSString)predicateType
{
  return self->_predicateType;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_predicateType, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end