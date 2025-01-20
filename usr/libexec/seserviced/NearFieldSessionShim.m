@interface NearFieldSessionShim
- (id)transceive:(id)a3 outError:(id *)a4;
- (unint64_t)validatePairing:(id *)a3;
- (void)dealloc;
@end

@implementation NearFieldSessionShim

- (void)dealloc
{
  (*((void (**)(void))self->_onDealloc + 2))();
  v3.receiver = self;
  v3.super_class = (Class)NearFieldSessionShim;
  [(NearFieldSessionShim *)&v3 dealloc];
}

- (id)transceive:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  if (self->_invalidated)
  {
    if (a4)
    {
      v7 = sub_100058290();
      SESCreateAndLogError();
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = 0;
  }
  else
  {
    session = self->_session;
    seid = self->_seid;
    id v16 = 0;
    v8 = [(NFSecureElementManagerSession *)session transceive:v6 forSEID:seid error:&v16];
    id v11 = v16;
    v12 = v11;
    if (v8) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    if (!v13)
    {
      if (a4)
      {
        v14 = sub_100058290();
        SESCreateAndLogError();
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      self->_invalidated = 1;
    }
  }

  return v8;
}

- (unint64_t)validatePairing:(id *)a3
{
  if (self->_invalidated)
  {
    unint64_t v4 = 4279897;
    if (a3)
    {
      v5 = sub_100058290();
      SESCreateAndLogError();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    unsigned int v6 = [(NFSecureElementManagerSession *)self->_session validateSEPairings:0];
    if (v6)
    {
      if (v6 == 27)
      {
        return 0;
      }
      else
      {
        unint64_t v4 = 4279897;
        if (a3)
        {
          v7 = sub_100058290();
          SESCreateAndLogError();
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    else
    {
      return 1;
    }
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onDealloc, 0);
  objc_storeStrong((id *)&self->_seid, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end