@interface NSLayoutXAxisAnchor
- (id)_maps_constraintWithRHDAnchor:(id)a3 relation:(int64_t)a4 constant:(double)a5 priority:(float)a6;
@end

@implementation NSLayoutXAxisAnchor

- (id)_maps_constraintWithRHDAnchor:(id)a3 relation:(int64_t)a4 constant:(double)a5 priority:(float)a6
{
  id v10 = a3;
  v11 = [(NSLayoutXAxisAnchor *)self item];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    v14 = [v13 window];
    if (objc_msgSend(v14, "_car_isHybridInstrumentCluster"))
    {
      v15 = [v13 window];
      BOOL v16 = [v15 _car_hybridInstrumentClusterAlignment] == 2;
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }
  v17 = +[MapsExternalDevice sharedInstance];
  unsigned __int8 v18 = [v17 rightHandDrive];

  if ((v18 & 1) != 0 || v16)
  {
    a5 = -a5;
    if (a4 == -1)
    {
LABEL_18:
      uint64_t v20 = [(NSLayoutXAxisAnchor *)self constraintGreaterThanOrEqualToAnchor:v10 constant:a5];
      goto LABEL_20;
    }
    if (a4 == 1)
    {
LABEL_17:
      uint64_t v20 = [(NSLayoutXAxisAnchor *)self constraintLessThanOrEqualToAnchor:v10 constant:a5];
LABEL_20:
      v21 = (void *)v20;
      goto LABEL_21;
    }
  }
  switch(a4)
  {
    case 1:
      goto LABEL_18;
    case 0:
      uint64_t v20 = [(NSLayoutXAxisAnchor *)self constraintEqualToAnchor:v10 constant:a5];
      goto LABEL_20;
    case -1:
      goto LABEL_17;
  }
  v21 = 0;
LABEL_21:
  *(float *)&double v19 = a6;
  [v21 setPriority:v19];

  return v21;
}

@end