@interface RTNavigationRouteSummary
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (RTMapItem)destinationMapItem;
- (RTMapItem)originMapItem;
- (RTNavigationRouteSummary)init;
- (RTNavigationRouteSummary)initWithCoder:(id)a3;
- (RTNavigationRouteSummary)initWithOriginMapItem:(id)a3 destinationMapItem:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDestinationMapItem:(id)a3;
- (void)setOriginMapItem:(id)a3;
@end

@implementation RTNavigationRouteSummary

- (RTNavigationRouteSummary)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithOriginMapItem_destinationMapItem_);
}

- (RTNavigationRouteSummary)initWithOriginMapItem:(id)a3 destinationMapItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v12 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: originMapItem";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: destinationMapItem";
    goto LABEL_12;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTNavigationRouteSummary;
  v10 = [(RTNavigationRouteSummary *)&v16 init];
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_originMapItem, a3);
    objc_storeStrong(p_isa + 2, a4);
  }
  self = p_isa;
  v12 = self;
LABEL_10:

  return v12;
}

- (id)description
{
  v3 = NSString;
  v4 = [(RTNavigationRouteSummary *)self originMapItem];
  v5 = [(RTNavigationRouteSummary *)self destinationMapItem];
  v6 = [v3 stringWithFormat:@"origin map item, %@, destination map item, %@", v4, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTNavigationRouteSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectForKey:@"OriginMapItem"];
  v6 = [v4 decodeObjectForKey:@"DestinationMapItem"];

  id v7 = [(RTNavigationRouteSummary *)self initWithOriginMapItem:v5 destinationMapItem:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  originMapItem = self->_originMapItem;
  id v5 = a3;
  [v5 encodeObject:originMapItem forKey:@"OriginMapItem"];
  [v5 encodeObject:self->_destinationMapItem forKey:@"DestinationMapItem"];
}

- (unint64_t)hash
{
  v3 = [(RTNavigationRouteSummary *)self originMapItem];
  uint64_t v4 = [v3 hash];
  id v5 = [(RTNavigationRouteSummary *)self destinationMapItem];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RTNavigationRouteSummary *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t v6 = [(RTNavigationRouteSummary *)self originMapItem];
      id v7 = [(RTNavigationRouteSummary *)v5 originMapItem];
      if ([v6 isEqualToMapItem:v7])
      {
        id v8 = [(RTNavigationRouteSummary *)self destinationMapItem];
        v9 = [(RTNavigationRouteSummary *)v5 destinationMapItem];
        char v10 = [v8 isEqualToMapItem:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (RTMapItem)originMapItem
{
  return self->_originMapItem;
}

- (void)setOriginMapItem:(id)a3
{
}

- (RTMapItem)destinationMapItem
{
  return self->_destinationMapItem;
}

- (void)setDestinationMapItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationMapItem, 0);

  objc_storeStrong((id *)&self->_originMapItem, 0);
}

@end