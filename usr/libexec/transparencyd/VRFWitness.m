@interface VRFWitness
+ (id)descriptor;
- (NSData)message;
- (TransparencyVRFVerifier)verifier;
- (id)diagnosticsJsonDictionary;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setMessage:(id)a3;
- (void)setVerifier:(id)a3;
@end

@implementation VRFWitness

+ (id)descriptor
{
  id result = (id)qword_10032ED88;
  if (!qword_10032ED88)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:VRFWitness messageName:@"VRFWitness" fileDescription:&unk_100324E10 fields:&off_100324DB0 fieldCount:3 storageSize:24 flags:v3];
    qword_10032ED88 = (uint64_t)result;
  }
  return result;
}

- (TransparencyVRFVerifier)verifier
{
  return (TransparencyVRFVerifier *)objc_getAssociatedObject(self, @"verifier");
}

- (void)setVerifier:(id)a3
{
}

- (NSData)message
{
  return (NSData *)objc_getAssociatedObject(self, @"message");
}

- (void)setMessage:(id)a3
{
}

- (id)diagnosticsJsonDictionary
{
  v11[0] = @"type";
  uint64_t v3 = VRFType_EnumDescriptor();
  v4 = [v3 textFormatNameForValue:-[VRFWitness type](self, "type")];
  v12[0] = v4;
  v11[1] = @"output";
  v5 = [(VRFWitness *)self output];
  v6 = [v5 kt_hexString];
  v12[1] = v6;
  v11[2] = @"proof";
  v7 = [(VRFWitness *)self proof];
  v8 = [v7 kt_hexString];
  v12[2] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v9;
}

- (unint64_t)verifyWithError:(id *)a3
{
  unsigned int v5 = [(VRFWitness *)self type];
  v6 = [(VRFWitness *)self verifier];
  unsigned int v7 = [v6 vrfType];

  if (v5 == v7)
  {
    v8 = [(VRFWitness *)self verifier];
    v9 = [(VRFWitness *)self message];
    v10 = [(VRFWitness *)self output];
    v11 = [(VRFWitness *)self proof];
    unsigned __int8 v12 = [v8 verifyMessage:v9 salt:0 output:v10 proof:v11 error:a3];

    if (v12)
    {
      return 1;
    }
    else
    {
      v15 = [(VRFWitness *)self verifier];
      v16 = [v15 key];
      unsigned int v17 = [v16 needsRefresh];

      if (v17) {
        return 2;
      }
      else {
        return 0;
      }
    }
  }
  else
  {
    if (a3)
    {
      *a3 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -55, @"Unknown VRF algorithm used for VRF witness: %d", VRFWitness_Type_RawValue((uint64_t)self) code description];
    }
    if (qword_10032F328 != -1) {
      dispatch_once(&qword_10032F328, &stru_1002C96D0);
    }
    v14 = qword_10032F330;
    if (os_log_type_enabled((os_log_t)qword_10032F330, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unknown VRF algorithm used for VRF witness", buf, 2u);
    }
    return 0;
  }
}

@end