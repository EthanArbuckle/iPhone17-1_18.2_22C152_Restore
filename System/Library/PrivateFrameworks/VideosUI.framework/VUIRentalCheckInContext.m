@interface VUIRentalCheckInContext
- (BOOL)isEqual:(id)a3;
- (NSNumber)dsid;
- (NSNumber)rentalID;
- (VUIRentalCheckInContext)initWithRentalID:(id)a3 dsid:(id)a4;
- (unint64_t)hash;
@end

@implementation VUIRentalCheckInContext

- (VUIRentalCheckInContext)initWithRentalID:(id)a3 dsid:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VUIRentalCheckInContext;
  v9 = [(VUIRentalCheckInContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rentalID, a3);
    objc_storeStrong((id *)&v10->_dsid, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VUIRentalCheckInContext *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  if (self == v4)
  {
    char v11 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = v5;
    id v7 = [(VUIRentalCheckInContext *)self rentalID];
    id v8 = [(VUIRentalCheckInContext *)v6 rentalID];
    if ([v7 isEqualToNumber:v8])
    {
      v9 = [(VUIRentalCheckInContext *)self dsid];
      v10 = [(VUIRentalCheckInContext *)v6 dsid];
      char v11 = [v9 isEqualToNumber:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
LABEL_6:
    char v11 = 0;
  }
LABEL_10:

  return v11;
}

- (unint64_t)hash
{
  v3 = [(VUIRentalCheckInContext *)self rentalID];
  uint64_t v4 = [v3 hash];
  v5 = [(VUIRentalCheckInContext *)self dsid];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSNumber)rentalID
{
  return self->_rentalID;
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_rentalID, 0);
}

@end