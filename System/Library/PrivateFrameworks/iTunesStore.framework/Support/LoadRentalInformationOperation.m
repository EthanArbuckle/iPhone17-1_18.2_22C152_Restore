@interface LoadRentalInformationOperation
- (LoadRentalInformationOperation)initWithAccountIdentifier:(id)a3 rentalKeyIdentifier:(id)a4;
- (NSDictionary)rentalInformation;
- (NSNumber)accountIdentifier;
- (NSNumber)rentalKeyIdentifier;
- (void)run;
- (void)setAccountIdentifier:(id)a3;
- (void)setRentalKeyIdentifier:(id)a3;
@end

@implementation LoadRentalInformationOperation

- (LoadRentalInformationOperation)initWithAccountIdentifier:(id)a3 rentalKeyIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)LoadRentalInformationOperation;
  v8 = [(LoadRentalInformationOperation *)&v14 init];
  if (v8)
  {
    v9 = (NSNumber *)[v6 copy];
    accountIdentifier = v8->_accountIdentifier;
    v8->_accountIdentifier = v9;

    v11 = (NSNumber *)[v7 copy];
    rentalKeyIdentifier = v8->_rentalKeyIdentifier;
    v8->_rentalKeyIdentifier = v11;
  }
  return v8;
}

- (void)run
{
  v3 = [(LoadRentalInformationOperation *)self rentalKeyIdentifier];
  if (v3)
  {
    v4 = v3;
    v5 = [(LoadRentalInformationOperation *)self accountIdentifier];

    if (v5)
    {
      id v6 = [(LoadRentalInformationOperation *)self accountIdentifier];
      id v7 = [v6 unsignedLongLongValue];
      v8 = [(LoadRentalInformationOperation *)self rentalKeyIdentifier];
      v9 = sub_10002DD60((uint64_t)v7, (uint64_t)[v8 unsignedLongLongValue]);

      if (v9)
      {
        id v21 = +[NSMutableDictionary dictionary];
        v10 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)[v9 rentalStartTime]);
        v11 = sub_10002A5D0();
        [v21 setObject:v10 forKey:v11];

        v12 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 rentalDuration]);
        v13 = sub_10002A5A0();
        [v21 setObject:v12 forKey:v13];

        objc_super v14 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 playbackDuration]);
        v15 = sub_10002A5B0();
        [v21 setObject:v14 forKey:v15];

        if ([v9 playbackStartTime] != -1)
        {
          v16 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)[v9 playbackStartTime]);
          v17 = sub_10002A5C0();
          [v21 setObject:v16 forKey:v17];
        }
        [(LoadRentalInformationOperation *)self setSuccess:1];
      }
      else
      {
        [(LoadRentalInformationOperation *)self setSuccess:0];
        v18 = SSError();
        [(LoadRentalInformationOperation *)self setError:v18];

        id v21 = 0;
      }

      v3 = v21;
    }
    else
    {
      v3 = 0;
    }
  }
  id v22 = v3;
  v19 = (NSDictionary *)[v3 copy];
  rentalInformation = self->_rentalInformation;
  self->_rentalInformation = v19;
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSNumber)rentalKeyIdentifier
{
  return self->_rentalKeyIdentifier;
}

- (void)setRentalKeyIdentifier:(id)a3
{
}

- (NSDictionary)rentalInformation
{
  return self->_rentalInformation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rentalInformation, 0);
  objc_storeStrong((id *)&self->_rentalKeyIdentifier, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end