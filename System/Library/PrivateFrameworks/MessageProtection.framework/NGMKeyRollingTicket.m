@interface NGMKeyRollingTicket
- (NGMFullPrekey)prekey;
- (NGMPublicDeviceIdentity)registrationInfo;
- (id)identityData;
- (id)initTicketWithSigningKey:(id)a3 error:(id *)a4;
- (id)prekeyData;
- (id)publicDeviceIdentity;
@end

@implementation NGMKeyRollingTicket

- (id)initTicketWithSigningKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NGMKeyRollingTicket;
  v7 = [(NGMKeyRollingTicket *)&v19 init];
  if (!v7) {
    goto LABEL_4;
  }
  v8 = [[NGMFullPrekey alloc] initWithPrekeySignedBy:v6 error:a4];
  prekey = v7->_prekey;
  v7->_prekey = v8;

  if (!v7->_prekey)
  {
    v17 = MessageProtectionLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[NGMKeyRollingTicket initTicketWithSigningKey:error:](v17);
    }

    goto LABEL_9;
  }
  v10 = [NGMPublicDeviceIdentity alloc];
  v11 = [(NGMFullPrekey *)v7->_prekey publicPrekey];
  v12 = [(NGMFullPrekey *)v7->_prekey tetraRegistration];
  v13 = [v6 publicKey];
  uint64_t v14 = [(NGMPublicDeviceIdentity *)v10 initWithEchnidaRegistration:v11 tetraRegistration:v12 signingKey:v13];
  registrationInfo = v7->_registrationInfo;
  v7->_registrationInfo = (NGMPublicDeviceIdentity *)v14;

  if (!v7->_registrationInfo)
  {
    MPLogAndAssignError(700, a4, @"Failed to initialize the public identity.");
LABEL_9:
    v16 = 0;
    goto LABEL_10;
  }
LABEL_4:
  v16 = v7;
LABEL_10:

  return v16;
}

- (id)identityData
{
  v2 = [(NGMKeyRollingTicket *)self registrationInfo];
  v3 = [v2 identityData];

  return v3;
}

- (id)prekeyData
{
  v2 = [(NGMKeyRollingTicket *)self registrationInfo];
  v3 = [v2 prekeyData];

  return v3;
}

- (id)publicDeviceIdentity
{
  return self->_registrationInfo;
}

- (NGMFullPrekey)prekey
{
  return self->_prekey;
}

- (NGMPublicDeviceIdentity)registrationInfo
{
  return self->_registrationInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationInfo, 0);
  objc_storeStrong((id *)&self->_prekey, 0);
}

- (void)initTicketWithSigningKey:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2163F2000, log, OS_LOG_TYPE_ERROR, "Failed to generate a key rolling ticket because of failed prekey generation.", v1, 2u);
}

@end