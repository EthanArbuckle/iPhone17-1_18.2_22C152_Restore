@interface PLAggregateState
+ (id)stateWithSubstateIndices:(id)a3;
- (NSNumber)compositeTime;
- (NSNumber)count;
- (NSNumber)energy;
- (NSNumber)energyAbsolute;
- (NSNumber)energyAbsoluteNet;
- (NSNumber)energyChargeAccumNet;
- (NSNumber)energyPassedChargeNet;
- (NSNumber)energyRaw;
- (NSNumber)time;
- (NSSet)substateIndices;
- (PLAggregateState)init;
- (PLAggregateState)initWithSubstateIndices:(id)a3;
- (void)dealloc;
- (void)incrementCount;
- (void)resetStats;
- (void)setCompositeTime:(id)a3;
- (void)setCount:(id)a3;
- (void)setEnergy:(id)a3;
- (void)setEnergyAbsolute:(id)a3;
- (void)setEnergyAbsoluteNet:(id)a3;
- (void)setEnergyChargeAccumNet:(id)a3;
- (void)setEnergyPassedChargeNet:(id)a3;
- (void)setEnergyRaw:(id)a3;
- (void)setSubstateIndices:(id)a3;
- (void)setTime:(id)a3;
- (void)setTime:(id)a3 energy:(id)a4 energyAbsolute:(id)a5 energyAbsoluteNet:(id)a6 energyPassedChargeNet:(id)a7 energyChargeAccumNet:(id)a8 energyRaw:(id)a9;
- (void)updateCompositeStateWithBaseStates:(id)a3;
@end

@implementation PLAggregateState

- (PLAggregateState)init
{
  v5.receiver = self;
  v5.super_class = (Class)PLAggregateState;
  v2 = [(PLAggregateState *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(PLAggregateState *)v2 resetStats];
    [(PLAggregateState *)v3 setCompositeTime:&off_13CB8];
  }
  return v3;
}

- (PLAggregateState)initWithSubstateIndices:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PLAggregateState;
  v4 = [(PLAggregateState *)&v7 init];
  objc_super v5 = v4;
  if (v4)
  {
    [(PLAggregateState *)v4 setTime:&off_13CB8];
    [(PLAggregateState *)v5 setEnergy:&off_13CB8];
    [(PLAggregateState *)v5 setEnergyAbsolute:&off_13CB8];
    [(PLAggregateState *)v5 setEnergyAbsoluteNet:&off_13CB8];
    [(PLAggregateState *)v5 setEnergyPassedChargeNet:&off_13CB8];
    [(PLAggregateState *)v5 setEnergyChargeAccumNet:&off_13CB8];
    [(PLAggregateState *)v5 setEnergyRaw:&off_13CB8];
    [(PLAggregateState *)v5 setCount:&off_13CB8];
    [(PLAggregateState *)v5 setSubstateIndices:a3];
    [(PLAggregateState *)v5 setCompositeTime:&off_13CB8];
  }
  return v5;
}

+ (id)stateWithSubstateIndices:(id)a3
{
  v3 = [[PLAggregateState alloc] initWithSubstateIndices:a3];

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PLAggregateState;
  [(PLAggregateState *)&v3 dealloc];
}

- (void)setTime:(id)a3 energy:(id)a4 energyAbsolute:(id)a5 energyAbsoluteNet:(id)a6 energyPassedChargeNet:(id)a7 energyChargeAccumNet:(id)a8 energyRaw:(id)a9
{
  [(PLAggregateState *)self setTime:a3];
  [(PLAggregateState *)self setEnergy:a4];
  [(PLAggregateState *)self setEnergyAbsolute:a5];
  [(PLAggregateState *)self setEnergyRaw:a9];
  [(PLAggregateState *)self setEnergyAbsoluteNet:a6];
  [(PLAggregateState *)self setEnergyPassedChargeNet:a7];

  [(PLAggregateState *)self setEnergyChargeAccumNet:a8];
}

- (void)resetStats
{
  [(PLAggregateState *)self setTime:&off_13CB8 energy:&off_13CB8 energyAbsolute:&off_13CB8 energyAbsoluteNet:&off_13CB8 energyPassedChargeNet:&off_13CB8 energyChargeAccumNet:&off_13CB8 energyRaw:&off_13CB8];

  [(PLAggregateState *)self setCount:&off_13CB8];
}

- (void)incrementCount
{
  objc_super v3 = +[NSNumber numberWithInteger:(char *)[(NSNumber *)[(PLAggregateState *)self count] integerValue] + 1];

  [(PLAggregateState *)self setCount:v3];
}

- (void)updateCompositeStateWithBaseStates:(id)a3
{
  [(PLAggregateState *)self setTime:&off_13CB8 energy:&off_13CB8 energyAbsolute:&off_13CB8 energyAbsoluteNet:&off_13CB8 energyPassedChargeNet:&off_13CB8 energyChargeAccumNet:&off_13CB8 energyRaw:&off_13CB8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  objc_super v5 = [(PLAggregateState *)self substateIndices];
  id v6 = [(NSSet *)v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v36;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v9);
        [(NSNumber *)[(PLAggregateState *)self time] doubleValue];
        double v12 = v11;
        objc_msgSend(objc_msgSend(objc_msgSend(a3, "objectAtIndex:", objc_msgSend(v10, "integerValue")), "time"), "doubleValue");
        [(PLAggregateState *)self setTime:+[NSNumber numberWithDouble:v12 + v13]];
        [(NSNumber *)[(PLAggregateState *)self energy] doubleValue];
        double v15 = v14;
        objc_msgSend(objc_msgSend(objc_msgSend(a3, "objectAtIndex:", objc_msgSend(v10, "integerValue")), "energy"), "doubleValue");
        [(PLAggregateState *)self setEnergy:+[NSNumber numberWithDouble:v15 + v16]];
        [(NSNumber *)[(PLAggregateState *)self energyAbsolute] doubleValue];
        double v18 = v17;
        objc_msgSend(objc_msgSend(objc_msgSend(a3, "objectAtIndex:", objc_msgSend(v10, "integerValue")), "energyAbsolute"), "doubleValue");
        [(PLAggregateState *)self setEnergyAbsolute:+[NSNumber numberWithDouble:v18 + v19]];
        [(NSNumber *)[(PLAggregateState *)self energyAbsoluteNet] doubleValue];
        double v21 = v20;
        objc_msgSend(objc_msgSend(objc_msgSend(a3, "objectAtIndex:", objc_msgSend(v10, "integerValue")), "energyAbsoluteNet"), "doubleValue");
        [(PLAggregateState *)self setEnergyAbsoluteNet:+[NSNumber numberWithDouble:v21 + v22]];
        [(NSNumber *)[(PLAggregateState *)self energyPassedChargeNet] doubleValue];
        double v24 = v23;
        objc_msgSend(objc_msgSend(objc_msgSend(a3, "objectAtIndex:", objc_msgSend(v10, "integerValue")), "energyPassedChargeNet"), "doubleValue");
        [(PLAggregateState *)self setEnergyPassedChargeNet:+[NSNumber numberWithDouble:v24 + v25]];
        [(NSNumber *)[(PLAggregateState *)self energyChargeAccumNet] doubleValue];
        double v27 = v26;
        objc_msgSend(objc_msgSend(objc_msgSend(a3, "objectAtIndex:", objc_msgSend(v10, "integerValue")), "energyChargeAccumNet"), "doubleValue");
        [(PLAggregateState *)self setEnergyChargeAccumNet:+[NSNumber numberWithDouble:v27 + v28]];
        [(NSNumber *)[(PLAggregateState *)self energyRaw] doubleValue];
        double v30 = v29;
        objc_msgSend(objc_msgSend(objc_msgSend(a3, "objectAtIndex:", objc_msgSend(v10, "integerValue")), "energyRaw"), "doubleValue");
        [(PLAggregateState *)self setEnergyRaw:+[NSNumber numberWithDouble:v30 + v31]];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSSet *)v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v7);
  }
  [(NSNumber *)[(PLAggregateState *)self compositeTime] doubleValue];
  double v33 = v32;
  [(NSNumber *)[(PLAggregateState *)self time] doubleValue];
  [(PLAggregateState *)self setCompositeTime:+[NSNumber numberWithDouble:v33 + v34]];
}

- (NSNumber)energy
{
  return self->energy;
}

- (void)setEnergy:(id)a3
{
}

- (NSNumber)energyAbsolute
{
  return self->energyAbsolute;
}

- (void)setEnergyAbsolute:(id)a3
{
}

- (NSNumber)energyAbsoluteNet
{
  return self->energyAbsoluteNet;
}

- (void)setEnergyAbsoluteNet:(id)a3
{
}

- (NSNumber)energyPassedChargeNet
{
  return self->energyPassedChargeNet;
}

- (void)setEnergyPassedChargeNet:(id)a3
{
}

- (NSNumber)energyChargeAccumNet
{
  return self->energyChargeAccumNet;
}

- (void)setEnergyChargeAccumNet:(id)a3
{
}

- (NSNumber)energyRaw
{
  return self->energyRaw;
}

- (void)setEnergyRaw:(id)a3
{
}

- (NSNumber)time
{
  return self->time;
}

- (void)setTime:(id)a3
{
}

- (NSNumber)count
{
  return self->count;
}

- (void)setCount:(id)a3
{
}

- (NSSet)substateIndices
{
  return self->substateIndices;
}

- (void)setSubstateIndices:(id)a3
{
}

- (NSNumber)compositeTime
{
  return self->compositeTime;
}

- (void)setCompositeTime:(id)a3
{
}

@end