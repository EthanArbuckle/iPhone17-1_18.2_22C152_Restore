@interface _SVXDeviceSetupOptionsMutation
- (_SVXDeviceSetupOptionsMutation)init;
- (_SVXDeviceSetupOptionsMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setGender:(int64_t)a3;
- (void)setHasActiveAccount:(int64_t)a3;
- (void)setIsNewsRestricted:(int64_t)a3;
- (void)setLanguageCode:(id)a3;
@end

@implementation _SVXDeviceSetupOptionsMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageCode, 0);

  objc_storeStrong((id *)&self->_baseModel, 0);
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = [[SVXDeviceSetupOptions alloc] initWithLanguageCode:self->_languageCode gender:self->_gender hasActiveAccount:self->_hasActiveAccount isNewsRestricted:self->_isNewsRestricted];
    goto LABEL_5;
  }
  if ((*(unsigned char *)&self->_mutationFlags & 1) == 0)
  {
    v4 = (SVXDeviceSetupOptions *)[(SVXDeviceSetupOptions *)baseModel copy];
LABEL_5:
    v5 = v4;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v6 = self->_languageCode;
  }
  else
  {
    v6 = [(SVXDeviceSetupOptions *)baseModel languageCode];
  }
  v7 = v6;
  char mutationFlags = (char)self->_mutationFlags;
  if ((mutationFlags & 4) == 0)
  {
    int64_t gender = [(SVXDeviceSetupOptions *)self->_baseModel gender];
    char mutationFlags = (char)self->_mutationFlags;
    if ((mutationFlags & 8) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    int64_t hasActiveAccount = [(SVXDeviceSetupOptions *)self->_baseModel hasActiveAccount];
    if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0) {
      goto LABEL_12;
    }
LABEL_15:
    int64_t isNewsRestricted = [(SVXDeviceSetupOptions *)self->_baseModel isNewsRestricted];
    goto LABEL_16;
  }
  int64_t gender = self->_gender;
  if ((*(unsigned char *)&self->_mutationFlags & 8) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  int64_t hasActiveAccount = self->_hasActiveAccount;
  if ((mutationFlags & 0x10) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  int64_t isNewsRestricted = self->_isNewsRestricted;
LABEL_16:
  v5 = [[SVXDeviceSetupOptions alloc] initWithLanguageCode:v7 gender:gender hasActiveAccount:hasActiveAccount isNewsRestricted:isNewsRestricted];

LABEL_17:

  return v5;
}

- (void)setIsNewsRestricted:(int64_t)a3
{
  self->_int64_t isNewsRestricted = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (void)setHasActiveAccount:(int64_t)a3
{
  self->_int64_t hasActiveAccount = a3;
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (void)setGender:(int64_t)a3
{
  self->_int64_t gender = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setLanguageCode:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_SVXDeviceSetupOptionsMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXDeviceSetupOptionsMutation;
  v6 = [(_SVXDeviceSetupOptionsMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXDeviceSetupOptionsMutation)init
{
  return [(_SVXDeviceSetupOptionsMutation *)self initWithBaseModel:0];
}

@end