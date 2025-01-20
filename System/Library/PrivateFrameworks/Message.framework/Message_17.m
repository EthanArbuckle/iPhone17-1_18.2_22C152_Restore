ValueMetadata *type metadata accessor for AccountConfiguration()
{
  return &type metadata for AccountConfiguration;
}

uint64_t sub_1A8A5191C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
  return a1;
}

uint64_t assignWithCopy for AccountConfiguration.Endpoint(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy18_8_4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AccountConfiguration.Endpoint(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountConfiguration.Endpoint(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 18)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AccountConfiguration.Endpoint(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 18) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 18) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountConfiguration.Endpoint()
{
  return &type metadata for AccountConfiguration.Endpoint;
}

unsigned char *__swift_memcpy1_1_9(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

unsigned char *storeEnumTagSinglePayload for AccountConfiguration.TransportLayerSecurity(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 194 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 194) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0x3E) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0x3D)
  {
    unsigned int v6 = ((a2 - 62) >> 8) + 1;
    *__n128 result = a2 - 62;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1A8A51B7CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = 4 * (((-a2 >> 2) & 0xF) - 16 * a2);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountConfiguration.TransportLayerSecurity()
{
  return &type metadata for AccountConfiguration.TransportLayerSecurity;
}

ValueMetadata *type metadata accessor for AccountConfiguration.CertificateTrustPolicy()
{
  return &type metadata for AccountConfiguration.CertificateTrustPolicy;
}

ValueMetadata *type metadata accessor for AccountConfiguration.CodingKeys()
{
  return &type metadata for AccountConfiguration.CodingKeys;
}

ValueMetadata *type metadata accessor for AccountConfiguration.CertificateTrustPolicy.CodingKeys()
{
  return &type metadata for AccountConfiguration.CertificateTrustPolicy.CodingKeys;
}

ValueMetadata *type metadata accessor for AccountConfiguration.CertificateTrustPolicy.RequireTrustedTLS12CodingKeys()
{
  return &type metadata for AccountConfiguration.CertificateTrustPolicy.RequireTrustedTLS12CodingKeys;
}

ValueMetadata *type metadata accessor for AccountConfiguration.CertificateTrustPolicy.RequireTrustedTLS13CodingKeys()
{
  return &type metadata for AccountConfiguration.CertificateTrustPolicy.RequireTrustedTLS13CodingKeys;
}

ValueMetadata *type metadata accessor for AccountConfiguration.CertificateTrustPolicy.AllowUserOverrideCodingKeys()
{
  return &type metadata for AccountConfiguration.CertificateTrustPolicy.AllowUserOverrideCodingKeys;
}

unsigned char *_s20IMAPSearchIndexerXPC20AccountConfigurationV22CertificateTrustPolicyOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *__n128 result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1A8A51CE4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountConfiguration.TransportLayerSecurity.CodingKeys()
{
  return &type metadata for AccountConfiguration.TransportLayerSecurity.CodingKeys;
}

ValueMetadata *type metadata accessor for AccountConfiguration.TransportLayerSecurity.InsecureCodingKeys()
{
  return &type metadata for AccountConfiguration.TransportLayerSecurity.InsecureCodingKeys;
}

ValueMetadata *type metadata accessor for AccountConfiguration.TransportLayerSecurity.StartTLSCodingKeys()
{
  return &type metadata for AccountConfiguration.TransportLayerSecurity.StartTLSCodingKeys;
}

ValueMetadata *type metadata accessor for AccountConfiguration.TransportLayerSecurity.TlsCodingKeys()
{
  return &type metadata for AccountConfiguration.TransportLayerSecurity.TlsCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for AccountConfiguration.Endpoint.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1A8A51E20);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountConfiguration.Endpoint.CodingKeys()
{
  return &type metadata for AccountConfiguration.Endpoint.CodingKeys;
}

unsigned char *_s20IMAPSearchIndexerXPC20AccountConfigurationV22TransportLayerSecurityO18StartTLSCodingKeysOwst_0(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1A8A51EF4);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountID.CodingKeys()
{
  return &type metadata for AccountID.CodingKeys;
}

unint64_t sub_1A8A51F30()
{
  unint64_t result = qword_1E974EEC8;
  if (!qword_1E974EEC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974EEC8);
  }
  return result;
}

unint64_t sub_1A8A51F88()
{
  unint64_t result = qword_1E974EED0;
  if (!qword_1E974EED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974EED0);
  }
  return result;
}

unint64_t sub_1A8A51FE0()
{
  unint64_t result = qword_1E974EED8;
  if (!qword_1E974EED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974EED8);
  }
  return result;
}

unint64_t sub_1A8A52038()
{
  unint64_t result = qword_1E974EEE0;
  if (!qword_1E974EEE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974EEE0);
  }
  return result;
}

unint64_t sub_1A8A52090()
{
  unint64_t result = qword_1E974EEE8;
  if (!qword_1E974EEE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974EEE8);
  }
  return result;
}

unint64_t sub_1A8A520E8()
{
  unint64_t result = qword_1E974EEF0;
  if (!qword_1E974EEF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974EEF0);
  }
  return result;
}

unint64_t sub_1A8A52140()
{
  unint64_t result = qword_1E974EEF8;
  if (!qword_1E974EEF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974EEF8);
  }
  return result;
}

unint64_t sub_1A8A52198()
{
  unint64_t result = qword_1E9746820;
  if (!qword_1E9746820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746820);
  }
  return result;
}

unint64_t sub_1A8A521F0()
{
  unint64_t result = qword_1E9746818;
  if (!qword_1E9746818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746818);
  }
  return result;
}

unint64_t sub_1A8A52248()
{
  unint64_t result = qword_1E9746860;
  if (!qword_1E9746860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746860);
  }
  return result;
}

unint64_t sub_1A8A522A0()
{
  unint64_t result = qword_1E9746858;
  if (!qword_1E9746858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746858);
  }
  return result;
}

unint64_t sub_1A8A522F8()
{
  unint64_t result = qword_1E9746870;
  if (!qword_1E9746870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746870);
  }
  return result;
}

unint64_t sub_1A8A52350()
{
  unint64_t result = qword_1E9746868;
  if (!qword_1E9746868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746868);
  }
  return result;
}

unint64_t sub_1A8A523A8()
{
  unint64_t result = qword_1E9746848;
  if (!qword_1E9746848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746848);
  }
  return result;
}

unint64_t sub_1A8A52400()
{
  unint64_t result = qword_1E9746840;
  if (!qword_1E9746840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746840);
  }
  return result;
}

unint64_t sub_1A8A52458()
{
  unint64_t result = qword_1E9746838;
  if (!qword_1E9746838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746838);
  }
  return result;
}

unint64_t sub_1A8A524B0()
{
  unint64_t result = qword_1E9746830;
  if (!qword_1E9746830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746830);
  }
  return result;
}

unint64_t sub_1A8A52508()
{
  unint64_t result = qword_1E97468B8;
  if (!qword_1E97468B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97468B8);
  }
  return result;
}

unint64_t sub_1A8A52560()
{
  unint64_t result = qword_1E97468B0;
  if (!qword_1E97468B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97468B0);
  }
  return result;
}

unint64_t sub_1A8A525B8()
{
  unint64_t result = qword_1E97468C8;
  if (!qword_1E97468C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97468C8);
  }
  return result;
}

unint64_t sub_1A8A52610()
{
  unint64_t result = qword_1E97468C0;
  if (!qword_1E97468C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97468C0);
  }
  return result;
}

unint64_t sub_1A8A52668()
{
  unint64_t result = qword_1E97468A8;
  if (!qword_1E97468A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97468A8);
  }
  return result;
}

unint64_t sub_1A8A526C0()
{
  unint64_t result = qword_1E97468A0;
  if (!qword_1E97468A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97468A0);
  }
  return result;
}

unint64_t sub_1A8A52718()
{
  unint64_t result = qword_1E9746890;
  if (!qword_1E9746890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746890);
  }
  return result;
}

unint64_t sub_1A8A52770()
{
  unint64_t result = qword_1E9746888;
  if (!qword_1E9746888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746888);
  }
  return result;
}

unint64_t sub_1A8A527C8()
{
  unint64_t result = qword_1E97468E8;
  if (!qword_1E97468E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97468E8);
  }
  return result;
}

unint64_t sub_1A8A52820()
{
  unint64_t result = qword_1E97468E0;
  if (!qword_1E97468E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97468E0);
  }
  return result;
}

unint64_t sub_1A8A52878()
{
  unint64_t result = qword_1E9746988;
  if (!qword_1E9746988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746988);
  }
  return result;
}

unint64_t sub_1A8A528D0()
{
  unint64_t result = qword_1E9746980;
  if (!qword_1E9746980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746980);
  }
  return result;
}

unint64_t sub_1A8A52924()
{
  unint64_t result = qword_1E9746998;
  if (!qword_1E9746998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746998);
  }
  return result;
}

unint64_t sub_1A8A52978()
{
  unint64_t result = qword_1E974EF08;
  if (!qword_1E974EF08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974EF08);
  }
  return result;
}

unint64_t sub_1A8A529CC()
{
  unint64_t result = qword_1E974EF10;
  if (!qword_1E974EF10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974EF10);
  }
  return result;
}

unint64_t sub_1A8A52A20()
{
  unint64_t result = qword_1E974EF60;
  if (!qword_1E974EF60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974EF60);
  }
  return result;
}

void _s3__C16os_unfair_lock_sVMa_1()
{
  if (!qword_1E9740F80)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1E9740F80);
    }
  }
}

uint64_t sub_1A8A52AD8(char a1)
{
  return *(void *)&aPersonidtoken[8 * a1];
}

uint64_t sub_1A8A52AF8(char a1)
{
  return *(void *)&aUsernameapplet[8 * a1];
}

uint64_t sub_1A8A52B18(char a1)
{
  if (a1) {
    return 0x6F54737365636361;
  }
  else {
    return 0x656D616E72657375;
  }
}

uint64_t sub_1A8A52B58(char a1)
{
  if (a1) {
    return 0x64726F7773736170;
  }
  else {
    return 12383;
  }
}

uint64_t sub_1A8A52B88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8A55398(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1A8A52BB4()
{
  sub_1A8A55248();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A52BF0()
{
  sub_1A8A55248();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A52C2C()
{
  return sub_1A8A52AD8(*v0);
}

uint64_t sub_1A8A52C34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8A5542C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A8A52C5C()
{
  sub_1A8A552F0();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A52C98()
{
  sub_1A8A552F0();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A52CD4()
{
  return sub_1A8A52AF8(*v0);
}

uint64_t sub_1A8A52CDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8A5564C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A8A52D04()
{
  sub_1A8A5514C();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A52D40()
{
  sub_1A8A5514C();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A52D7C()
{
  return sub_1A8A52B18(*v0);
}

uint64_t sub_1A8A52D84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8A5585C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A8A52DAC()
{
  sub_1A8A551F4();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A52DE8()
{
  sub_1A8A551F4();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A52E24()
{
  sub_1A8A551A0();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A52E60()
{
  sub_1A8A551A0();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A52E9C()
{
  return sub_1A8A52B58(*v0);
}

uint64_t sub_1A8A52EA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8A55958(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A8A52ECC()
{
  sub_1A8A55344();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A52F08()
{
  sub_1A8A55344();
  return sub_1A8A78A58();
}

uint64_t Credentials.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  sub_1A8912CB0(v2, &v75);
  *((void *)&v61 + 1) = *((void *)&v75 + 1);
  unint64_t v62 = v75;
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747410);
  *(void *)&long long v61 = *(void *)(v63 - 8);
  MEMORY[0x1F4188790](v63);
  uint64_t v5 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747428);
  unint64_t v59 = *(void *)(v65 - 8);
  MEMORY[0x1F4188790](v65);
  uint64_t v64 = (uint64_t)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747430);
  unint64_t v69 = *(void *)(v60 - 8);
  MEMORY[0x1F4188790](v60);
  v8 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v67 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747420);
  uint64_t v58 = *(void *)(v67 - 8);
  MEMORY[0x1F4188790](v67);
  v66 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747418);
  uint64_t v68 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  v12 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747408);
  uint64_t v70 = *(void *)(v84 - 8);
  MEMORY[0x1F4188790](v84);
  v14 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1_0(a1, a1[3]);
  sub_1A8A5514C();
  v72 = v14;
  sub_1A8A78858();
  sub_1A8912CB0(v2, &v76);
  switch((v83 >> 59) & 6 | ((v82[0] & 0x2000000000000000) != 0))
  {
    case 1uLL:
      v82[0] &= ~0x2000000000000000uLL;
      unint64_t v22 = v82[0];
      v83 &= 0xCFFFFFFFFFFFFFFFLL;
      unint64_t v23 = v83;
      long long v24 = v76;
      uint64_t v25 = v77;
      unint64_t v26 = v78;
      uint64_t v27 = v79;
      unint64_t v28 = v80;
      uint64_t v63 = v81;
      uint64_t v29 = v82[1];
      LOBYTE(v74) = 1;
      sub_1A8512DFC(v76, *((unint64_t *)&v76 + 1));
      uint64_t v65 = v25;
      unint64_t v69 = v26;
      sub_1A8512DFC(v25, v26);
      uint64_t v68 = v27;
      uint64_t v30 = v27;
      uint64_t v31 = v63;
      unint64_t v62 = v28;
      sub_1A8512DFC(v30, v28);
      sub_1A8512DFC(v31, v22);
      uint64_t v64 = v29;
      sub_1A8512DFC(v29, v23);
      sub_1A8A552F0();
      v32 = v66;
      uint64_t v33 = v84;
      v34 = v72;
      sub_1A8A783C8();
      long long v61 = v24;
      long long v74 = v24;
      char v73 = 0;
      unint64_t v35 = sub_1A8A5529C();
      unint64_t v36 = v67;
      uint64_t v60 = v35;
      unint64_t v37 = v71;
      sub_1A8A78468();
      if (v37)
      {
        sub_1A85135AC(v31, v22);
        sub_1A85135AC(v68, v62);
        sub_1A85135AC(v65, v69);
        sub_1A85135AC(v64, v23);
        (*(void (**)(char *, unint64_t))(v58 + 8))(v32, v36);
        (*(void (**)(char *, uint64_t))(v70 + 8))(v34, v33);
        uint64_t v38 = v61;
        v39 = v82;
        goto LABEL_12;
      }
      uint64_t v52 = v31;
      unint64_t v53 = v62;
      unint64_t v71 = v23;
      *(void *)&long long v74 = v65;
      *((void *)&v74 + 1) = v69;
      char v73 = 1;
      v54 = v32;
      sub_1A8A78468();
      *(void *)&long long v74 = v68;
      *((void *)&v74 + 1) = v53;
      char v73 = 2;
      sub_1A8A78468();
      *(void *)&long long v74 = v52;
      unint64_t v59 = v22;
      *((void *)&v74 + 1) = v22;
      char v73 = 3;
      sub_1A8A78468();
      *(void *)&long long v74 = v64;
      unint64_t v55 = v71;
      *((void *)&v74 + 1) = v71;
      char v73 = 4;
      sub_1A8A78468();
      unint64_t v56 = *((void *)&v61 + 1);
      uint64_t v57 = v61;
      sub_1A85135AC(v52, v22);
      sub_1A85135AC(v68, v53);
      sub_1A85135AC(v65, v69);
      sub_1A85135AC(v57, v56);
      (*(void (**)(char *, unint64_t))(v58 + 8))(v54, v36);
      (*(void (**)(char *, uint64_t))(v70 + 8))(v72, v84);
      uint64_t v38 = v64;
      unint64_t v51 = v55;
      goto LABEL_13;
    case 2uLL:
      v82[0] &= ~0x2000000000000000uLL;
      v83 &= 0xCFFFFFFFFFFFFFFFLL;
      long long v40 = v76;
      LOBYTE(v74) = 2;
      sub_1A8512DFC(v62, *((unint64_t *)&v61 + 1));
      sub_1A8A55248();
      uint64_t v41 = v84;
      v42 = v72;
      sub_1A8A783C8();
      long long v74 = v40;
      sub_1A8A5529C();
      uint64_t v43 = v60;
      sub_1A8A78468();
      (*(void (**)(char *, uint64_t))(v69 + 8))(v8, v43);
      (*(void (**)(char *, uint64_t))(v70 + 8))(v42, v41);
      uint64_t result = sub_1A8A5685C((uint64_t)v2);
      break;
    case 3uLL:
      v82[0] &= ~0x2000000000000000uLL;
      v83 &= 0xCFFFFFFFFFFFFFFFLL;
      LOBYTE(v74) = 3;
      sub_1A8A551F4();
      uint64_t v44 = v64;
      uint64_t v45 = v84;
      v46 = v72;
      sub_1A8A783C8();
      LOBYTE(v74) = 0;
      uint64_t v47 = v65;
      unint64_t v48 = v71;
      sub_1A8A78438();
      if (!v48)
      {
        LOBYTE(v74) = 1;
        sub_1A8A78438();
      }
      (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v44, v47);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v70 + 8))(v46, v45);
      break;
    case 4uLL:
      LOBYTE(v74) = 4;
      sub_1A8A551A0();
      uint64_t v49 = v84;
      v50 = v72;
      sub_1A8A783C8();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v5, v63);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v70 + 8))(v50, v49);
      break;
    default:
      v82[0] &= ~0x2000000000000000uLL;
      v83 &= 0xCFFFFFFFFFFFFFFFLL;
      long long v15 = v76;
      uint64_t v16 = v77;
      unint64_t v17 = v78;
      LOBYTE(v74) = 0;
      sub_1A8512DFC(v76, *((unint64_t *)&v76 + 1));
      unint64_t v69 = v16;
      unint64_t v67 = v17;
      sub_1A8512DFC(v16, v17);
      sub_1A8A55344();
      uint64_t v18 = v84;
      v19 = v72;
      sub_1A8A783C8();
      long long v74 = v15;
      char v73 = 0;
      sub_1A8A5529C();
      unint64_t v20 = v71;
      sub_1A8A78468();
      if (v20)
      {
        sub_1A85135AC(v69, v67);
        (*(void (**)(char *, uint64_t))(v68 + 8))(v12, v10);
        (*(void (**)(char *, uint64_t))(v70 + 8))(v19, v18);
        uint64_t result = sub_1A85135AC(v15, *((unint64_t *)&v15 + 1));
      }
      else
      {
        *(void *)&long long v74 = v69;
        *((void *)&v74 + 1) = v67;
        char v73 = 1;
        sub_1A8A78468();
        sub_1A85135AC(v15, *((unint64_t *)&v15 + 1));
        (*(void (**)(char *, uint64_t))(v68 + 8))(v12, v10);
        (*(void (**)(char *, uint64_t))(v70 + 8))(v19, v18);
        uint64_t v38 = v69;
        v39 = &v85;
LABEL_12:
        unint64_t v51 = *(v39 - 32);
LABEL_13:
        uint64_t result = sub_1A85135AC(v38, v51);
      }
      break;
  }
  return result;
}

_OWORD *Credentials.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t result = (_OWORD *)sub_1A8A55A2C(a1, (uint64_t *)v5);
  if (!v2) {
    return sub_1A8912CB0(v5, a2);
  }
  return result;
}

uint64_t sub_1A8A53DC4(_OWORD *a1, _OWORD *a2)
{
  sub_1A8912CB0(a1, v4);
  sub_1A8912CB0(a2, v5);
  return _s20IMAPSearchIndexerXPC11CredentialsO21__derived_enum_equalsySbAC_ACtFZ_0(v4, v5) & 1;
}

_OWORD *sub_1A8A53E10@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t result = (_OWORD *)sub_1A8A55A2C(a1, (uint64_t *)v5);
  if (!v2) {
    return sub_1A8912CB0(v5, a2);
  }
  return result;
}

uint64_t sub_1A8A53E58(void *a1)
{
  sub_1A8912CB0(v1, v4);
  return Credentials.encode(to:)(a1);
}

uint64_t Credentials.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1A8A53ED8(a1, (uint64_t (*)(uint64_t, uint64_t *))sub_1A896724C, a2);
}

{
  return sub_1A8A53ED8(a1, (uint64_t (*)(uint64_t, uint64_t *))sub_1A8912CB0, a2);
}

uint64_t sub_1A8A53ED8@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t *)@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = a2(a1, &v21);
  unint64_t v5 = v28;
  unint64_t v6 = 0x2000000000000000;
  uint64_t v7 = 0;
  unint64_t v8 = 0;
  uint64_t v9 = 0;
  unint64_t v10 = 0;
  uint64_t v11 = 0;
  unint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  switch((v30 >> 59) & 6 | ((v28 & 0x2000000000000000) != 0))
  {
    case 1uLL:
      v28 &= ~0x2000000000000000uLL;
      unint64_t v18 = v28;
      v30 &= 0xCFFFFFFFFFFFFFFFLL;
      unint64_t v6 = v30;
      uint64_t v7 = v21;
      unint64_t v8 = v22;
      unint64_t v10 = v24;
      uint64_t v19 = v23;
      uint64_t v11 = v25;
      unint64_t v12 = v26;
      uint64_t v13 = v27;
      uint64_t v15 = v29;
      sub_1A8512DFC(v21, v22);
      sub_1A8512DFC(v19, v10);
      sub_1A8512DFC(v11, v12);
      sub_1A8512DFC(v13, v18);
      sub_1A8512DFC(v15, v6);
      uint64_t result = sub_1A8A5685C(a1);
      uint64_t v9 = v19;
      uint64_t v14 = v5 | 0x2000000000000000;
      break;
    case 2uLL:
      uint64_t v9 = 0;
      unint64_t v10 = 0;
      uint64_t v11 = 0;
      unint64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v7 = v21;
      unint64_t v8 = v22;
      unint64_t v6 = 0x1000000000000000;
      break;
    case 3uLL:
      v28 &= ~0x2000000000000000uLL;
      v30 &= 0xCFFFFFFFFFFFFFFFLL;
      uint64_t v7 = v21;
      unint64_t v8 = v22;
      uint64_t v17 = v23;
      unint64_t v10 = v24;
      _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
      _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
      uint64_t result = sub_1A8A5685C(a1);
      uint64_t v9 = v17;
      uint64_t v11 = 0;
      unint64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v15 = 0;
      unint64_t v6 = 0x1000000000000000;
      uint64_t v14 = 0x2000000000000000;
      break;
    case 4uLL:
      break;
    default:
      v28 &= ~0x2000000000000000uLL;
      v30 &= 0xCFFFFFFFFFFFFFFFLL;
      uint64_t v7 = v21;
      unint64_t v8 = v22;
      uint64_t v16 = v23;
      unint64_t v10 = v24;
      sub_1A8512DFC(v21, v22);
      sub_1A8512DFC(v16, v10);
      uint64_t result = sub_1A8A5685C(a1);
      uint64_t v9 = v16;
      uint64_t v11 = 0;
      unint64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      unint64_t v6 = 0;
      break;
  }
  *a3 = v7;
  a3[1] = v8;
  a3[2] = v9;
  a3[3] = v10;
  a3[4] = v11;
  a3[5] = v12;
  a3[6] = v13;
  a3[7] = v14;
  a3[8] = v15;
  a3[9] = v6;
  return result;
}

uint64_t sub_1A8A54104@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_1A8512DFC(a2, a3);
      unint64_t v10 = (char *)sub_1A8A74588();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_1A8A745B8();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_1A8A745A8();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x1A8A54368);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_1A85135AC(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)sub_1A8A74588();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_1A8A745B8();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_1A8A745A8();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_1A8A54378(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  __s1[2] = *MEMORY[0x1E4F143B8];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_1A8512DFC(a1, a2);
      char v5 = sub_1A8A545A8((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_1A85135AC(a1, a2);
      goto LABEL_6;
    case 2uLL:
      uint64_t v10 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      char v5 = sub_1A8A545A8(v11, v12, v10, a3, a4);
      swift_release();
      swift_release();
LABEL_6:
      sub_1A85135AC(a3, a4);
      return v5 & 1;
    case 3uLL:
      memset(__s1, 0, 14);
      goto LABEL_8;
    default:
      __s1[0] = a1;
      LOWORD(__s1[1]) = a2;
      BYTE2(__s1[1]) = BYTE2(a2);
      BYTE3(__s1[1]) = BYTE3(a2);
      BYTE4(__s1[1]) = BYTE4(a2);
      BYTE5(__s1[1]) = BYTE5(a2);
LABEL_8:
      sub_1A8A54104((uint64_t)__s1, a3, a4, &v14);
      sub_1A85135AC(a3, a4);
      if (!v4) {
        char v5 = v14;
      }
      return v5 & 1;
  }
}

uint64_t sub_1A8A545A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_1A8A74588();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_1A8A745B8();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_1A8A745A8();
  sub_1A8A54104(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_1A8A54660(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        JUMPOUT(0x1A8A5479CLL);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_20;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v15 = 1;
            }
            else
            {
              sub_1A8512DFC(a3, a4);
              char v15 = sub_1A8A54378(a1, a2, a3, a4);
            }
          }
          else
          {
            char v15 = 0;
          }
          return v15 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_21;
        case 3uLL:
          char v15 = v8 == 0;
          return v15 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_19;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t _s20IMAPSearchIndexerXPC11CredentialsO21__derived_enum_equalsySbAC_ACtFZ_0(_OWORD *a1, _OWORD *a2)
{
  sub_1A8912CB0(a1, &v61);
  long long v4 = v61;
  sub_1A8912CB0(a1, &v69);
  switch((v77 >> 59) & 6 | ((v75 & 0x2000000000000000) != 0))
  {
    case 1uLL:
      unint64_t v13 = v75 & 0xDFFFFFFFFFFFFFFFLL;
      unint64_t v14 = v77 & 0xCFFFFFFFFFFFFFFFLL;
      v75 &= ~0x2000000000000000uLL;
      v77 &= 0xCFFFFFFFFFFFFFFFLL;
      long long v15 = v69;
      uint64_t v17 = v70;
      unint64_t v16 = v71;
      uint64_t v19 = v72;
      unint64_t v18 = v73;
      uint64_t v20 = v74;
      uint64_t v60 = v76;
      sub_1A8912CB0(a2, &v62);
      if (((v68 >> 59) & 6 | ((v66 & 0x2000000000000000) != 0)) != 1) {
        goto LABEL_61;
      }
      unint64_t v56 = v14;
      unint64_t v57 = v18;
      v66 &= ~0x2000000000000000uLL;
      unint64_t v54 = v66;
      v68 &= 0xCFFFFFFFFFFFFFFFLL;
      unint64_t v21 = v68;
      int8x16_t v22 = v62;
      unint64_t v58 = v63.u64[1];
      uint64_t v59 = v63.i64[0];
      int8x16_t v55 = v64;
      uint64_t v52 = v65;
      unint64_t v53 = v62.u64[1];
      uint64_t v23 = v67;
      sub_1A8512DFC(v15, *((unint64_t *)&v15 + 1));
      sub_1A8512DFC(v22.i64[0], v22.u64[1]);
      sub_1A8512DFC(v17, v16);
      sub_1A8512DFC(v19, v57);
      sub_1A8512DFC(v20, v13);
      sub_1A8512DFC(v60, v56);
      sub_1A8512DFC(v59, v58);
      sub_1A8512DFC(v55.i64[0], v55.u64[1]);
      sub_1A8512DFC(v52, v54);
      sub_1A8512DFC(v23, v21);
      if ((sub_1A8A54660(v15, *((unint64_t *)&v15 + 1), v22.i64[0], v53) & 1) != 0
        && (sub_1A8A54660(v17, v16, v59, v58) & 1) != 0
        && (sub_1A8A54660(v19, v57, v55.i64[0], v55.u64[1]) & 1) != 0
        && (sub_1A8A54660(v20, v13, v52, v54) & 1) != 0)
      {
        char v24 = sub_1A8A54660(v60, v56, v23, v21);
        sub_1A85135AC(v23, v21);
        sub_1A85135AC(v52, v54);
        sub_1A85135AC(v55.i64[0], v55.u64[1]);
        sub_1A85135AC(v59, v58);
        sub_1A85135AC(v60, v56);
        sub_1A85135AC(v20, v13);
        sub_1A85135AC(v19, v57);
        sub_1A85135AC(v17, v16);
        sub_1A85135AC(v22.i64[0], v53);
        sub_1A85135AC(v15, *((unint64_t *)&v15 + 1));
        return v24 & 1;
      }
      sub_1A85135AC(v23, v21);
      sub_1A85135AC(v52, v54);
      sub_1A85135AC(v55.i64[0], v55.u64[1]);
      sub_1A85135AC(v59, v58);
      sub_1A85135AC(v60, v56);
      sub_1A85135AC(v20, v13);
      sub_1A85135AC(v19, v57);
      sub_1A85135AC(v17, v16);
      sub_1A85135AC(v22.i64[0], v53);
      unint64_t v50 = *((void *)&v15 + 1);
      uint64_t v49 = v15;
      goto LABEL_60;
    case 2uLL:
      v75 &= ~0x2000000000000000uLL;
      v77 &= 0xCFFFFFFFFFFFFFFFLL;
      unint64_t v26 = *((void *)&v69 + 1);
      uint64_t v25 = v69;
      sub_1A8912CB0(a2, &v62);
      if (((v68 >> 59) & 6 | ((v66 & 0x2000000000000000) != 0)) == 2)
      {
        v66 &= ~0x2000000000000000uLL;
        v68 &= 0xCFFFFFFFFFFFFFFFLL;
        unint64_t v28 = v62.u64[1];
        uint64_t v27 = v62.i64[0];
        uint64_t v29 = 0;
        switch(v26 >> 62)
        {
          case 1uLL:
            if (__OFSUB__(HIDWORD(v25), v25))
            {
              __break(1u);
LABEL_64:
              __break(1u);
LABEL_65:
              __break(1u);
LABEL_66:
              __break(1u);
LABEL_67:
              __break(1u);
LABEL_68:
              __break(1u);
LABEL_69:
              __break(1u);
LABEL_70:
              __break(1u);
              JUMPOUT(0x1A8A550F8);
            }
            uint64_t v29 = HIDWORD(v25) - (int)v25;
LABEL_28:
            sub_1A8512DFC(v4, *((unint64_t *)&v4 + 1));
LABEL_29:
            switch(v28 >> 62)
            {
              case 1uLL:
                LODWORD(v39) = HIDWORD(v27) - v27;
                if (__OFSUB__(HIDWORD(v27), v27)) {
                  goto LABEL_65;
                }
                uint64_t v39 = (int)v39;
LABEL_34:
                if (v29 != v39)
                {
LABEL_39:
                  sub_1A8A5685C((uint64_t)a1);
                  goto LABEL_61;
                }
                if (v29 < 1)
                {
LABEL_40:
                  sub_1A8A5685C((uint64_t)a1);
                  goto LABEL_41;
                }
                sub_1A8512DFC(v27, v28);
                char v43 = sub_1A8A54378(v25, v26, v27, v28);
                sub_1A8A5685C((uint64_t)a1);
                if (v43) {
                  goto LABEL_41;
                }
                break;
              case 2uLL:
                uint64_t v41 = *(void *)(v27 + 16);
                uint64_t v40 = *(void *)(v27 + 24);
                BOOL v42 = __OFSUB__(v40, v41);
                uint64_t v39 = v40 - v41;
                if (!v42) {
                  goto LABEL_34;
                }
                goto LABEL_66;
              case 3uLL:
                if (v29) {
                  goto LABEL_39;
                }
                goto LABEL_40;
              default:
                uint64_t v39 = BYTE6(v28);
                goto LABEL_34;
            }
            break;
          case 2uLL:
            uint64_t v38 = *(void *)(v25 + 16);
            uint64_t v37 = *(void *)(v25 + 24);
            uint64_t v29 = v37 - v38;
            if (!__OFSUB__(v37, v38)) {
              goto LABEL_28;
            }
            goto LABEL_64;
          case 3uLL:
            goto LABEL_29;
          default:
            uint64_t v29 = BYTE6(v26);
            goto LABEL_29;
        }
      }
      goto LABEL_61;
    case 3uLL:
      v75 &= ~0x2000000000000000uLL;
      v77 &= 0xCFFFFFFFFFFFFFFFLL;
      long long v30 = v69;
      uint64_t v31 = v70;
      unint64_t v32 = v71;
      sub_1A8912CB0(a2, &v62);
      if (((v68 >> 59) & 6 | ((v66 & 0x2000000000000000) != 0)) != 3) {
        goto LABEL_61;
      }
      v66 &= ~0x2000000000000000uLL;
      v68 &= 0xCFFFFFFFFFFFFFFFLL;
      int8x16_t v33 = v63;
      if (v30 == *(_OWORD *)&v62 || (char v24 = 0, (sub_1A8A78588() & 1) != 0))
      {
        if (__PAIR128__(v32, v31) == *(_OWORD *)&v33) {
LABEL_41:
        }
          char v24 = 1;
        else {
          char v24 = sub_1A8A78588();
        }
      }
      return v24 & 1;
    case 4uLL:
      sub_1A8912CB0(a2, &v62);
      if (((v68 >> 59) & 6 | ((v66 & 0x2000000000000000) != 0)) != 4) {
        goto LABEL_61;
      }
      if (v68 != 0x2000000000000000) {
        goto LABEL_61;
      }
      v34.i64[0] = v65;
      v34.i64[1] = v67;
      int8x16_t v35 = vorrq_s8(v64, v62);
      int8x16_t v36 = vorrq_s8(v34, vorrq_s8(vextq_s8(v63, v63, 8uLL), vextq_s8(v35, v35, 8uLL)));
      if (*(void *)&vorr_s8(*(int8x8_t *)v36.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v36, v36, 8uLL)) | v66) {
        goto LABEL_61;
      }
      goto LABEL_41;
    default:
      v75 &= ~0x2000000000000000uLL;
      v77 &= 0xCFFFFFFFFFFFFFFFLL;
      unint64_t v5 = *((void *)&v69 + 1);
      uint64_t v6 = v69;
      uint64_t v8 = v70;
      unint64_t v7 = v71;
      sub_1A8912CB0(a2, &v62);
      if ((v68 >> 59) & 6 | ((v66 & 0x2000000000000000) != 0)) {
        goto LABEL_61;
      }
      v66 &= ~0x2000000000000000uLL;
      v68 &= 0xCFFFFFFFFFFFFFFFLL;
      unint64_t v9 = v62.u64[1];
      uint64_t v10 = v62.i64[0];
      int8x16_t v11 = v63;
      uint64_t v12 = 0;
      switch(v5 >> 62)
      {
        case 1uLL:
          if (__OFSUB__(HIDWORD(v6), v6)) {
            goto LABEL_67;
          }
          uint64_t v12 = HIDWORD(v6) - (int)v6;
LABEL_45:
          sub_1A8512DFC(v6, v5);
          break;
        case 2uLL:
          uint64_t v45 = *(void *)(v6 + 16);
          uint64_t v44 = *(void *)(v6 + 24);
          uint64_t v12 = v44 - v45;
          if (!__OFSUB__(v44, v45)) {
            goto LABEL_45;
          }
          goto LABEL_68;
        case 3uLL:
          goto LABEL_46;
        default:
          uint64_t v12 = BYTE6(v5);
          goto LABEL_46;
      }
      break;
  }
LABEL_46:
  switch(v9 >> 62)
  {
    case 1uLL:
      LODWORD(v46) = HIDWORD(v10) - v10;
      if (__OFSUB__(HIDWORD(v10), v10)) {
        goto LABEL_69;
      }
      uint64_t v46 = (int)v46;
LABEL_51:
      if (v12 != v46) {
        goto LABEL_56;
      }
      if (v12 < 1)
      {
LABEL_57:
        sub_1A8512DFC(v10, v9);
        sub_1A8512DFC(v8, v7);
        sub_1A8512DFC(v11.i64[0], v11.u64[1]);
        goto LABEL_58;
      }
      sub_1A8512DFC(v10, v9);
      sub_1A8512DFC(v10, v9);
      sub_1A8512DFC(v8, v7);
      sub_1A8512DFC(v11.i64[0], v11.u64[1]);
      if (sub_1A8A54378(v6, v5, v10, v9))
      {
LABEL_58:
        char v24 = sub_1A8A54660(v8, v7, v11.i64[0], v11.u64[1]);
        sub_1A85135AC(v11.i64[0], v11.u64[1]);
        sub_1A85135AC(v8, v7);
        sub_1A85135AC(v10, v9);
        sub_1A85135AC(v6, v5);
        return v24 & 1;
      }
      sub_1A85135AC(v11.i64[0], v11.u64[1]);
      sub_1A85135AC(v8, v7);
      sub_1A85135AC(v10, v9);
LABEL_56:
      uint64_t v49 = v6;
      unint64_t v50 = v5;
LABEL_60:
      sub_1A85135AC(v49, v50);
LABEL_61:
      char v24 = 0;
      return v24 & 1;
    case 2uLL:
      uint64_t v48 = *(void *)(v10 + 16);
      uint64_t v47 = *(void *)(v10 + 24);
      BOOL v42 = __OFSUB__(v47, v48);
      uint64_t v46 = v47 - v48;
      if (!v42) {
        goto LABEL_51;
      }
      goto LABEL_70;
    case 3uLL:
      if (v12) {
        goto LABEL_56;
      }
      goto LABEL_57;
    default:
      uint64_t v46 = BYTE6(v9);
      goto LABEL_51;
  }
}

unint64_t sub_1A8A5514C()
{
  unint64_t result = qword_1E9746568;
  if (!qword_1E9746568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746568);
  }
  return result;
}

unint64_t sub_1A8A551A0()
{
  unint64_t result = qword_1E974EF70;
  if (!qword_1E974EF70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974EF70);
  }
  return result;
}

unint64_t sub_1A8A551F4()
{
  unint64_t result = qword_1E974EF78;
  if (!qword_1E974EF78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974EF78);
  }
  return result;
}

unint64_t sub_1A8A55248()
{
  unint64_t result = qword_1E97465C8;
  if (!qword_1E97465C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97465C8);
  }
  return result;
}

unint64_t sub_1A8A5529C()
{
  unint64_t result = qword_1E97412F0;
  if (!qword_1E97412F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97412F0);
  }
  return result;
}

unint64_t sub_1A8A552F0()
{
  unint64_t result = qword_1E97465A0;
  if (!qword_1E97465A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97465A0);
  }
  return result;
}

unint64_t sub_1A8A55344()
{
  unint64_t result = qword_1E974EF80;
  if (!qword_1E974EF80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974EF80);
  }
  return result;
}

uint64_t sub_1A8A55398(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6E656B6F74 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1A8A78588();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1A8A55418()
{
  return 0x6E656B6F74;
}

uint64_t sub_1A8A5542C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x44496E6F73726570 && a2 == 0xE800000000000000;
  if (v3 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E656B6F74 && a2 == 0xE500000000000000 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x49656E696863616DLL && a2 == 0xE900000000000044 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x50656D6954656E6FLL && a2 == 0xEF64726F77737361 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6E49746E65696C63 && a2 == 0xEA00000000006F66)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_1A8A78588();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_1A8A5564C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656D616E72657375 && a2 == 0xE800000000000000;
  if (v3 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6B6F54656C707061 && a2 == 0xEA00000000006E65 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6B6F54656C707061 && a2 == 0xEB00000000326E65 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6B6F54687475416FLL && a2 == 0xEA00000000006E65 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x68747541657270 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_1A8A78588();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_1A8A5585C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656D616E72657375 && a2 == 0xE800000000000000;
  if (v3 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F54737365636361 && a2 == 0xEB000000006E656BLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1A8A78588();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A8A55958(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 12383 && a2 == 0xE200000000000000;
  if (v3 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64726F7773736170 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1A8A78588();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A8A55A2C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v77 = a2;
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974EFB0);
  uint64_t v73 = *(void *)(v70 - 8);
  MEMORY[0x1F4188790](v70);
  unint64_t v80 = (char *)&v66 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974EFB8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v74 = v4;
  uint64_t v75 = v5;
  MEMORY[0x1F4188790](v4);
  uint64_t v79 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974EFC0);
  uint64_t v71 = *(void *)(v72 - 8);
  MEMORY[0x1F4188790](v72);
  unint64_t v78 = (char *)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974EFC8);
  uint64_t v76 = *(void *)(v69 - 8);
  MEMORY[0x1F4188790](v69);
  unint64_t v9 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974EFD0);
  uint64_t v68 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974EFD8);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  unint64_t v16 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = a1[3];
  uint64_t v81 = a1;
  __swift_project_boxed_opaque_existential_1_0(a1, v17);
  sub_1A8A5514C();
  uint64_t v18 = v82;
  sub_1A8A78828();
  if (v18)
  {
LABEL_13:
    uint64_t v40 = (uint64_t)v81;
    return __swift_destroy_boxed_opaque_existential_1(v40);
  }
  uint64_t v19 = v78;
  uint64_t v66 = v10;
  uint64_t v20 = v80;
  uint64_t v67 = 0;
  unint64_t v21 = v79;
  uint64_t v82 = v14;
  uint64_t v22 = sub_1A8A783B8();
  uint64_t v23 = (char *)v22;
  if (*(void *)(v22 + 16) != 1)
  {
    uint64_t v29 = sub_1A8A77E58();
    swift_allocError();
    uint64_t v31 = v30;
    __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974EF38);
    *uint64_t v31 = &type metadata for Credentials;
    sub_1A8A78318();
    sub_1A8A77E48();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v29 - 8) + 104))(v31, *MEMORY[0x1E4FBBA70], v29);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v82 + 8))(v16, v13);
    goto LABEL_13;
  }
  switch(*(unsigned char *)(v22 + 32))
  {
    case 1:
      LOBYTE(v91) = 1;
      sub_1A8A552F0();
      unint64_t v32 = v9;
      uint64_t v33 = v67;
      sub_1A8A78308();
      if (v33) {
        goto LABEL_12;
      }
      unint64_t v78 = v23;
      LOBYTE(v89) = 0;
      sub_1A8A57624();
      uint64_t v34 = v69;
      int8x16_t v35 = v32;
      sub_1A8A78378();
      uint64_t v47 = v92;
      uint64_t v75 = v91;
      LOBYTE(v87) = 1;
      sub_1A8A78378();
      uint64_t v73 = v47;
      uint64_t v57 = v90;
      unint64_t v80 = v89;
      LOBYTE(v85) = 2;
      sub_1A8A78378();
      uint64_t v71 = v57;
      uint64_t v72 = (uint64_t)v16;
      uint64_t v74 = v13;
      int8x16_t v62 = v87;
      uint64_t v63 = v88;
      LOBYTE(v83) = 3;
      sub_1A8A78378();
      uint64_t v52 = v85;
      uint64_t v64 = v86;
      char v93 = 4;
      sub_1A8A78378();
      uint64_t v67 = 0;
      uint64_t v79 = v62;
      (*(void (**)(char *, uint64_t))(v76 + 8))(v35, v34);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v72, v74);
      uint64_t v54 = v83;
      uint64_t v55 = v84;
      uint64_t v53 = v64 | 0x2000000000000000;
      uint64_t v65 = v73;
      uint64_t v28 = v75;
      uint64_t v56 = v71;
      uint64_t v51 = v63;
      goto LABEL_20;
    case 2:
      LOBYTE(v91) = 2;
      sub_1A8A55248();
      uint64_t v36 = v67;
      sub_1A8A78308();
      if (v36) {
        goto LABEL_12;
      }
      sub_1A8A57624();
      uint64_t v37 = v72;
      sub_1A8A78378();
      uint64_t v56 = 0;
      uint64_t v38 = v82;
      uint64_t v67 = 0;
      (*(void (**)(char *, uint64_t))(v71 + 8))(v19, v37);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v16, v13);
      uint64_t v79 = 0;
      unint64_t v80 = 0;
      uint64_t v51 = 0;
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v54 = 0;
      uint64_t v28 = v91;
      uint64_t v65 = v92;
      uint64_t v55 = 0x1000000000000000;
      goto LABEL_20;
    case 3:
      LOBYTE(v91) = 3;
      sub_1A8A551F4();
      uint64_t v39 = v67;
      sub_1A8A78308();
      if (v39) {
        goto LABEL_12;
      }
      LOBYTE(v91) = 0;
      uint64_t v43 = v74;
      uint64_t v44 = v21;
      uint64_t v45 = sub_1A8A78358();
      uint64_t v46 = v82;
      uint64_t v48 = v45;
      uint64_t v73 = v49;
      LOBYTE(v91) = 1;
      uint64_t v50 = sub_1A8A78358();
      uint64_t v67 = 0;
      unint64_t v58 = *(void (**)(char *, uint64_t))(v75 + 8);
      unint64_t v80 = (char *)v50;
      uint64_t v59 = v44;
      uint64_t v56 = v60;
      v58(v59, v43);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v16, v13);
      uint64_t v79 = 0;
      uint64_t v28 = v48;
      uint64_t v51 = 0;
      uint64_t v52 = 0;
      uint64_t v54 = 0;
      uint64_t v55 = 0x1000000000000000;
      uint64_t v53 = 0x2000000000000000;
      goto LABEL_19;
    case 4:
      LOBYTE(v91) = 4;
      sub_1A8A551A0();
      uint64_t v42 = v67;
      sub_1A8A78308();
      uint64_t v51 = v42;
      if (v42)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v82 + 8))(v16, v13);
        uint64_t v40 = (uint64_t)v81;
        return __swift_destroy_boxed_opaque_existential_1(v40);
      }
      (*(void (**)(char *, uint64_t))(v73 + 8))(v20, v70);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v82 + 8))(v16, v13);
      uint64_t v28 = 0;
      uint64_t v65 = 0;
      uint64_t v79 = 0;
      unint64_t v80 = 0;
      uint64_t v56 = 0;
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v54 = 0;
      uint64_t v55 = 0x2000000000000000;
      uint64_t v67 = 0;
      goto LABEL_20;
    default:
      LOBYTE(v91) = 0;
      sub_1A8A55344();
      char v24 = v12;
      uint64_t v25 = v67;
      sub_1A8A78308();
      if (v25)
      {
LABEL_12:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v82 + 8))(v16, v13);
        goto LABEL_13;
      }
      LOBYTE(v89) = 0;
      sub_1A8A57624();
      uint64_t v26 = v66;
      sub_1A8A78378();
      uint64_t v27 = v82;
      uint64_t v28 = v91;
      uint64_t v73 = v92;
      LOBYTE(v87) = 1;
      sub_1A8A78378();
      uint64_t v67 = 0;
      (*(void (**)(char *, uint64_t))(v68 + 8))(v24, v26);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v16, v13);
      uint64_t v51 = 0;
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      uint64_t v56 = v90;
      uint64_t v79 = 0;
      unint64_t v80 = v89;
LABEL_19:
      uint64_t v65 = v73;
LABEL_20:
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v81);
      long long v61 = v77;
      *unint64_t v77 = v28;
      v61[1] = v65;
      v61[2] = (uint64_t)v80;
      v61[3] = v56;
      v61[4] = (uint64_t)v79;
      v61[5] = v51;
      v61[6] = v52;
      v61[7] = v53;
      v61[8] = v54;
      v61[9] = v55;
      break;
  }
  return result;
}

uint64_t sub_1A8A5685C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1A8A568A8(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  switch((a10 >> 59) & 6 | ((a8 & 0x2000000000000000) != 0))
  {
    case 0uLL:
      sub_1A85135AC(result, a2);
      uint64_t result = a3;
      a2 = a4;
      goto LABEL_4;
    case 1uLL:
      unint64_t v15 = a8 & 0xDFFFFFFFFFFFFFFFLL;
      sub_1A85135AC(result, a2);
      sub_1A85135AC(a3, a4);
      sub_1A85135AC(a5, a6);
      sub_1A85135AC(a7, v15);
      uint64_t result = a9;
      a2 = a10 & 0xCFFFFFFFFFFFFFFFLL;
      goto LABEL_4;
    case 2uLL:
LABEL_4:
      uint64_t result = sub_1A85135AC(result, a2);
      break;
    case 3uLL:
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A8A569E4(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  switch((a10 >> 59) & 6 | ((a8 & 0x2000000000000000) != 0))
  {
    case 0uLL:
      sub_1A8512DFC(result, a2);
      uint64_t result = a3;
      a2 = a4;
      goto LABEL_4;
    case 1uLL:
      unint64_t v15 = a8 & 0xDFFFFFFFFFFFFFFFLL;
      sub_1A8512DFC(result, a2);
      sub_1A8512DFC(a3, a4);
      sub_1A8512DFC(a5, a6);
      sub_1A8512DFC(a7, v15);
      uint64_t result = a9;
      a2 = a10 & 0xCFFFFFFFFFFFFFFFLL;
      goto LABEL_4;
    case 2uLL:
LABEL_4:
      uint64_t result = sub_1A8512DFC(result, a2);
      break;
    case 3uLL:
      _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
      uint64_t result = _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Credentials.CodingKeys()
{
  return &type metadata for Credentials.CodingKeys;
}

ValueMetadata *type metadata accessor for Credentials.UsernameCodingKeys()
{
  return &type metadata for Credentials.UsernameCodingKeys;
}

unsigned char *_s20IMAPSearchIndexerXPC11CredentialsO10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1A8A56E2CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Credentials.AppleTokenCodingKeys()
{
  return &type metadata for Credentials.AppleTokenCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for Credentials.AppleToken2CodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1A8A56F00);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Credentials.AppleToken2CodingKeys()
{
  return &type metadata for Credentials.AppleToken2CodingKeys;
}

unsigned char *_s20IMAPSearchIndexerXPC11CredentialsO18UsernameCodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1A8A57004);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Credentials.OAuthTokenCodingKeys()
{
  return &type metadata for Credentials.OAuthTokenCodingKeys;
}

ValueMetadata *type metadata accessor for Credentials.PreAuthCodingKeys()
{
  return &type metadata for Credentials.PreAuthCodingKeys;
}

unint64_t sub_1A8A57050()
{
  unint64_t result = qword_1E974EF88;
  if (!qword_1E974EF88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974EF88);
  }
  return result;
}

unint64_t sub_1A8A570A8()
{
  unint64_t result = qword_1E974EF90;
  if (!qword_1E974EF90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974EF90);
  }
  return result;
}

unint64_t sub_1A8A57100()
{
  unint64_t result = qword_1E974EF98;
  if (!qword_1E974EF98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974EF98);
  }
  return result;
}

unint64_t sub_1A8A57158()
{
  unint64_t result = qword_1E974EFA0;
  if (!qword_1E974EFA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974EFA0);
  }
  return result;
}

unint64_t sub_1A8A571B0()
{
  unint64_t result = qword_1E974EFA8;
  if (!qword_1E974EFA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974EFA8);
  }
  return result;
}

unint64_t sub_1A8A57208()
{
  unint64_t result = qword_1E9746598;
  if (!qword_1E9746598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746598);
  }
  return result;
}

unint64_t sub_1A8A57260()
{
  unint64_t result = qword_1E9746590;
  if (!qword_1E9746590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746590);
  }
  return result;
}

unint64_t sub_1A8A572B8()
{
  unint64_t result = qword_1E97465B0;
  if (!qword_1E97465B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97465B0);
  }
  return result;
}

unint64_t sub_1A8A57310()
{
  unint64_t result = qword_1E97465A8;
  if (!qword_1E97465A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97465A8);
  }
  return result;
}

unint64_t sub_1A8A57368()
{
  unint64_t result = qword_1E97465D8;
  if (!qword_1E97465D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97465D8);
  }
  return result;
}

unint64_t sub_1A8A573C0()
{
  unint64_t result = qword_1E97465D0;
  if (!qword_1E97465D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97465D0);
  }
  return result;
}

unint64_t sub_1A8A57418()
{
  unint64_t result = qword_1E97465C0;
  if (!qword_1E97465C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97465C0);
  }
  return result;
}

unint64_t sub_1A8A57470()
{
  unint64_t result = qword_1E97465B8;
  if (!qword_1E97465B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97465B8);
  }
  return result;
}

unint64_t sub_1A8A574C8()
{
  unint64_t result = qword_1E9746588;
  if (!qword_1E9746588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746588);
  }
  return result;
}

unint64_t sub_1A8A57520()
{
  unint64_t result = qword_1E9746580;
  if (!qword_1E9746580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746580);
  }
  return result;
}

unint64_t sub_1A8A57578()
{
  unint64_t result = qword_1E9746578;
  if (!qword_1E9746578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746578);
  }
  return result;
}

unint64_t sub_1A8A575D0()
{
  unint64_t result = qword_1E9746570;
  if (!qword_1E9746570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746570);
  }
  return result;
}

unint64_t sub_1A8A57624()
{
  unint64_t result = qword_1E974EFE0;
  if (!qword_1E974EFE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974EFE0);
  }
  return result;
}

uint64_t static DownloadRequest.__derived_enum_equals(_:_:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a3) {
    return a6 & (a1 == a4);
  }
  uint64_t result = 0;
  if ((a6 & 1) == 0 && a1 == a4) {
    return sub_1A8A59798(a2, a5);
  }
  return result;
}

uint64_t sub_1A8A576B8(char a1)
{
  return *(void *)&aDownloadsearch_0[8 * a1];
}

uint64_t sub_1A8A576D8()
{
  return sub_1A8A576B8(*v0);
}

uint64_t sub_1A8A576E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8A5C5C4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A8A57708()
{
  sub_1A8A5C0C0();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A57744()
{
  sub_1A8A5C0C0();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A57780()
{
  sub_1A8A5C114();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A577BC()
{
  sub_1A8A5C114();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A577F8()
{
  sub_1A8A5C37C();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A57834()
{
  sub_1A8A5C37C();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A57870()
{
  sub_1A8A5C228();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A578AC()
{
  sub_1A8A5C228();
  return sub_1A8A78A58();
}

uint64_t MessageToSearchIndexer.encode(to:)(void *a1)
{
  uint64_t v2 = v1;
  sub_1A88EE118(v2, (uint64_t)v34);
  uint64_t v26 = (void *)v34[0];
  uint64_t v25 = v34[1];
  uint64_t v24 = v34[2];
  uint64_t v23 = v34[3];
  int v22 = v35;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747400);
  uint64_t v29 = *(void *)(v30 - 8);
  MEMORY[0x1F4188790](v30);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E97473E8);
  uint64_t v27 = *(void *)(v28 - 8);
  MEMORY[0x1F4188790](v28);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E97473F8);
  uint64_t v21 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E97473F0);
  uint64_t v32 = *(void *)(v31 - 8);
  MEMORY[0x1F4188790](v31);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1_0(a1, a1[3]);
  sub_1A8A5C0C0();
  sub_1A8A78858();
  sub_1A88EE118(v2, (uint64_t)v36);
  int v13 = v37 >> 6;
  if (v13)
  {
    v37 &= 0x3Fu;
    if (v13 == 1)
    {
      sub_1A88EE118(v36, (uint64_t)&v39);
      LOBYTE(v33[0]) = 1;
      sub_1A8A5C1BC(v26, v25, v24, v23, v22 & 0x3F);
      sub_1A8A5C228();
      uint64_t v14 = v31;
      sub_1A8A783C8();
      sub_1A88EE118(&v39, (uint64_t)v33);
      sub_1A8A5C27C();
      uint64_t v15 = v28;
      sub_1A8A78468();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v15);
      (*(void (**)(char *, uint64_t))(v32 + 8))(v12, v14);
      return sub_1A8A64518((uint64_t)v2, (void (*)(void, void, void, void, void))sub_1A8A5C2D0);
    }
    else
    {
      sub_1A8913E34(v36, &v40);
      LOBYTE(v33[0]) = 2;
      sub_1A8A5C114();
      uint64_t v18 = v31;
      sub_1A8A783C8();
      sub_1A8913E34(&v40, v33);
      sub_1A8A5C168();
      uint64_t v19 = v30;
      sub_1A8A78468();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v19);
      return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v12, v18);
    }
  }
  else
  {
    v37 &= 0x3Fu;
    sub_1A8940A50(v36, (uint64_t)&v38);
    LOBYTE(v33[0]) = 0;
    sub_1A8A5C37C();
    uint64_t v17 = v31;
    sub_1A8A783C8();
    sub_1A8940A50(&v38, (uint64_t)v33);
    sub_1A8A5C3D0();
    sub_1A8A78468();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v8);
    return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v12, v17);
  }
}

void MessageToSearchIndexer.init(from:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1A8A5C714(a1, v4);
  if (!v2) {
    sub_1A88EE118((long long *)v4, a2);
  }
}

void sub_1A8A57EDC(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1A8A5C714(a1, v4);
  if (!v2) {
    sub_1A88EE118((long long *)v4, a2);
  }
}

uint64_t sub_1A8A57F24(void *a1)
{
  sub_1A88EE118(v1, (uint64_t)v4);
  return MessageToSearchIndexer.encode(to:)(a1);
}

uint64_t sub_1A8A57F74(long long *a1, long long *a2)
{
  sub_1A88EE118(a1, (uint64_t)v4);
  sub_1A88EE118(a2, (uint64_t)v5);
  return _s20IMAPSearchIndexerXPC015MessageToSearchB0O21__derived_enum_equalsySbAC_ACtFZ_0(v4, v5) & 1;
}

BOOL static DownloadRequest.Response.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t static CredentialRequest.__derived_enum_equals(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4) {
    return 1;
  }
  else {
    return sub_1A8A78588();
  }
}

unint64_t sub_1A8A57FF8(char a1)
{
  unint64_t result = 0xD000000000000018;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x686372616573;
      break;
    case 2:
      unint64_t result = 0x69746E6564657263;
      break;
    case 3:
      return result;
    default:
      unint64_t result = 0x64616F6C6E776F64;
      break;
  }
  return result;
}

unint64_t sub_1A8A58094()
{
  return sub_1A8A57FF8(*v0);
}

uint64_t sub_1A8A5809C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8A5D074(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A8A580C4()
{
  sub_1A8A5CD80();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A58100()
{
  sub_1A8A5CD80();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A5813C()
{
  sub_1A8A5CE7C();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A58178()
{
  sub_1A8A5CE7C();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A581B4()
{
  sub_1A8A5CFCC();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A581F0()
{
  sub_1A8A5CFCC();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A5822C()
{
  sub_1A8A5CDD4();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A58268()
{
  sub_1A8A5CDD4();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A582A4()
{
  sub_1A8A5CF24();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A582E0()
{
  sub_1A8A5CF24();
  return sub_1A8A78A58();
}

uint64_t MessageFromSearchIndexer.encode(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v42 = a5;
  uint64_t v34 = a4;
  uint64_t v35 = a3;
  uint64_t v36 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974EFE8);
  uint64_t v32 = *(void *)(v6 - 8);
  uint64_t v33 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v31 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974EFF0);
  uint64_t v29 = *(void *)(v8 - 8);
  uint64_t v30 = v8;
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974EFF8);
  uint64_t v27 = *(void *)(v11 - 8);
  uint64_t v28 = v11;
  MEMORY[0x1F4188790](v11);
  int v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F000);
  uint64_t v26 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  unint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F008);
  uint64_t v37 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)&v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1_0(a1, a1[3]);
  sub_1A8A5CD80();
  sub_1A8A78858();
  switch(v42 >> 6)
  {
    case 1:
      char v22 = v42 & 0x3F;
      LOBYTE(v38) = 1;
      sub_1A8A5CF24();
      sub_1A8A783C8();
      uint64_t v38 = v36;
      uint64_t v39 = v35;
      uint64_t v40 = v34;
      char v41 = v22;
      sub_1A8A5CF78();
      uint64_t v23 = v28;
      sub_1A8A78468();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v23);
      break;
    case 2:
      LOBYTE(v38) = 2;
      sub_1A8A5CE7C();
      sub_1A8A783C8();
      uint64_t v38 = v36;
      uint64_t v39 = v35;
      sub_1A8A5CED0();
      uint64_t v20 = v30;
      sub_1A8A78468();
      uint64_t v21 = v29;
      goto LABEL_5;
    case 3:
      LOBYTE(v38) = 3;
      sub_1A8A5CDD4();
      uint64_t v10 = v31;
      sub_1A8A783C8();
      uint64_t v38 = v36;
      uint64_t v39 = v35;
      uint64_t v40 = v34;
      sub_1A8A5CE28();
      uint64_t v20 = v33;
      sub_1A8A78468();
      uint64_t v21 = v32;
LABEL_5:
      (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v20);
      break;
    default:
      LOBYTE(v38) = 0;
      sub_1A8A5CFCC();
      sub_1A8A783C8();
      LOBYTE(v38) = v36;
      sub_1A8A5D020();
      sub_1A8A78468();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v16, v14);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v19, v17);
}

uint64_t MessageFromSearchIndexer.init(from:)(uint64_t a1)
{
  return sub_1A8A5BB90(a1, (uint64_t (*)(void))sub_1A8A5D21C);
}

uint64_t sub_1A8A58890@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1A8A5D21C(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
    *(unsigned char *)(a2 + 24) = v7;
  }
  return result;
}

uint64_t sub_1A8A588C4(void *a1)
{
  return MessageFromSearchIndexer.encode(to:)(a1, *(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(unsigned __int8 *)(v1 + 24));
}

uint64_t sub_1A8A588E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A8A5BC2C(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void, void, void))_s20IMAPSearchIndexerXPC017MessageFromSearchB0O21__derived_enum_equalsySbAC_ACtFZ_0);
}

uint64_t XPCSession.sendToSearchIndexer(_:replyHandler:)(long long *a1, uint64_t a2, uint64_t a3)
{
  sub_1A88EE118(a1, (uint64_t)v7);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a2;
  *(void *)(v5 + 24) = a3;
  sub_1A8A5DAD8();
  sub_1A8A5DB2C();
  swift_retain();
  sub_1A8A75548();
  return swift_release();
}

uint64_t sub_1A8A589C0(uint64_t a1, uint64_t (*a2)(void, void, void, void))
{
  return a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned __int8 *)(a1 + 24) | (*(unsigned __int8 *)(a1 + 25) << 8));
}

uint64_t XPCSession.sendToSearchIndexer(_:)(long long *a1)
{
  sub_1A88EE118(a1, (uint64_t)v2);
  sub_1A8A5DAD8();
  return sub_1A8A75558();
}

uint64_t XPCSession.sendToMaild(_:replyHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a5;
  *(void *)(v8 + 24) = a6;
  sub_1A8A5DBBC();
  sub_1A8A5DC10();
  swift_retain();
  sub_1A8A75548();
  return swift_release();
}

uint64_t XPCSession.sendToMaild(_:)()
{
  return sub_1A8A75558();
}

uint64_t DownloadRequest.Response.hash(into:)()
{
  return sub_1A8A78768();
}

unint64_t sub_1A8A58B94(char a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6F43746F4E646964;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x6C706D6F43646964;
      break;
    case 4:
      unint64_t result = 0x6572756C696166;
      break;
    default:
      unint64_t result = 0x7265666544646964;
      break;
  }
  return result;
}

unint64_t sub_1A8A58C5C()
{
  return sub_1A8A58B94(*v0);
}

uint64_t sub_1A8A58C64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8A5DE5C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A8A58C8C()
{
  sub_1A8A5DC64();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A58CC8()
{
  sub_1A8A5DC64();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A58D04()
{
  sub_1A8A5DD60();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A58D40()
{
  sub_1A8A5DD60();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A58D7C()
{
  sub_1A8A5DD0C();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A58DB8()
{
  sub_1A8A5DD0C();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A58DF4()
{
  sub_1A8A5DE08();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A58E30()
{
  sub_1A8A5DE08();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A58E6C()
{
  sub_1A8A5DDB4();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A58EA8()
{
  sub_1A8A5DDB4();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A58EE4()
{
  sub_1A8A5DCB8();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A58F20()
{
  sub_1A8A5DCB8();
  return sub_1A8A78A58();
}

uint64_t DownloadRequest.Response.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v35 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F040);
  uint64_t v33 = *(void *)(v3 - 8);
  uint64_t v34 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v32 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F048);
  uint64_t v30 = *(void *)(v5 - 8);
  uint64_t v31 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v29 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F050);
  uint64_t v27 = *(void *)(v7 - 8);
  uint64_t v28 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v26 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F058);
  uint64_t v24 = *(void *)(v9 - 8);
  uint64_t v25 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F060);
  uint64_t v23 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F068);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  uint64_t v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1_0(a1, a1[3]);
  sub_1A8A5DC64();
  sub_1A8A78858();
  switch((char)v35)
  {
    case 1:
      char v37 = 1;
      sub_1A8A5DDB4();
      sub_1A8A783C8();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v25);
      return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    case 2:
      char v38 = 2;
      sub_1A8A5DD60();
      uint64_t v19 = v26;
      sub_1A8A783C8();
      uint64_t v21 = v27;
      uint64_t v20 = v28;
      goto LABEL_7;
    case 3:
      char v39 = 3;
      sub_1A8A5DD0C();
      uint64_t v19 = v29;
      sub_1A8A783C8();
      uint64_t v21 = v30;
      uint64_t v20 = v31;
      goto LABEL_7;
    case 4:
      char v40 = 4;
      sub_1A8A5DCB8();
      uint64_t v19 = v32;
      sub_1A8A783C8();
      uint64_t v21 = v33;
      uint64_t v20 = v34;
LABEL_7:
      (*(void (**)(char *, uint64_t))(v21 + 8))(v19, v20);
      break;
    default:
      char v36 = 0;
      sub_1A8A5DE08();
      sub_1A8A783C8();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v12);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
}

uint64_t DownloadRequest.Response.hashValue.getter()
{
  return sub_1A8A787C8();
}

uint64_t DownloadRequest.Response.init(from:)(void *a1)
{
  return sub_1A8A5E084(a1);
}

uint64_t sub_1A8A594C0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1A8A5E084(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1A8A594EC(void *a1)
{
  return DownloadRequest.Response.encode(to:)(a1, *v1);
}

BOOL static DownloadRequest.ID.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _s20IMAPSearchIndexerXPC18CredentialResponseO21__derived_enum_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      char v6 = 1;
    }
    else
    {
      uint64_t v3 = (_OWORD *)(a1 + 32);
      uint64_t v4 = (_OWORD *)(a2 + 32);
      uint64_t v5 = v2 - 1;
      do
      {
        sub_1A8912CB0(v3, v10);
        sub_1A8912CB0(v4, v11);
        sub_1A8A64330(v10, (void (*)(void, void, void, void, void, void, void, void, void, void))sub_1A8A569E4);
        sub_1A8A64330(v11, (void (*)(void, void, void, void, void, void, void, void, void, void))sub_1A8A569E4);
        char v6 = _s20IMAPSearchIndexerXPC11CredentialsO21__derived_enum_equalsySbAC_ACtFZ_0(v10, v11);
        sub_1A8A64330(v11, (void (*)(void, void, void, void, void, void, void, void, void, void))sub_1A8A64384);
        sub_1A8A64330(v10, (void (*)(void, void, void, void, void, void, void, void, void, void))sub_1A8A64384);
        BOOL v8 = v5-- != 0;
        if ((v6 & 1) == 0) {
          break;
        }
        v3 += 5;
        v4 += 5;
      }
      while (v8);
    }
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

BOOL sub_1A8A5961C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (*(_DWORD *)(a1 + 32) != *(_DWORD *)(a2 + 32)) {
    return 0;
  }
  uint64_t v3 = (int *)(a1 + 36);
  uint64_t v4 = (int *)(a2 + 36);
  uint64_t v5 = v2 - 1;
  do
  {
    BOOL result = v5 == 0;
    if (!v5) {
      break;
    }
    int v8 = *v3++;
    int v7 = v8;
    int v9 = *v4++;
    --v5;
  }
  while (v7 == v9);
  return result;
}

uint64_t sub_1A8A59688(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = a1 + 32;
    uint64_t v5 = a2 + 32;
    while (1)
    {
      char v6 = (unsigned __int8 **)(v4 + 24 * v3);
      int v7 = *v6;
      int v8 = (unsigned __int8 **)(v5 + 24 * v3);
      int v9 = *v8;
      uint64_t v10 = *((void *)*v6 + 2);
      if (v10 != *((void *)*v8 + 2)) {
        break;
      }
      uint64_t v11 = v6[1];
      uint64_t v12 = v6[2];
      if (v10) {
        BOOL v13 = v7 == v9;
      }
      else {
        BOOL v13 = 1;
      }
      if (!v13)
      {
        if (v7[32] != v9[32]) {
          return 0;
        }
        if (v10 != 1)
        {
          if (v7[33] != v9[33]) {
            return 0;
          }
          uint64_t v14 = v7 + 34;
          uint64_t v15 = v9 + 34;
          for (uint64_t i = v10 - 2; i; --i)
          {
            int v18 = *v14++;
            int v17 = v18;
            int v19 = *v15++;
            if (v17 != v19) {
              return 0;
            }
          }
        }
      }
      if ((v11 != v8[1] || v12 != v8[2]) && (sub_1A8A78588() & 1) == 0) {
        break;
      }
      if (++v3 == v2) {
        return 1;
      }
    }
    return 0;
  }
  return 1;
}

uint64_t sub_1A8A59798(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2)
  {
    uint64_t v3 = a2;
    if (a1 != a2)
    {
      uint64_t v4 = 0;
      uint64_t v19 = a1;
      while (1)
      {
        uint64_t v5 = *(void *)(a1 + v4 + 48);
        uint64_t v6 = *(void *)(a1 + v4 + 56);
        int v7 = *(unsigned __int16 *)(a1 + v4 + 64);
        unsigned int v8 = *(unsigned __int8 *)(a1 + v4 + 66);
        uint64_t v9 = *(void *)(v3 + v4 + 48);
        uint64_t v10 = *(void *)(v3 + v4 + 56);
        int v11 = *(unsigned __int16 *)(v3 + v4 + 64);
        unsigned int v12 = *(unsigned __int8 *)(v3 + v4 + 66);
        BOOL v13 = *(void *)(a1 + v4 + 32) == *(void *)(v3 + v4 + 32)
           && *(void *)(a1 + v4 + 40) == *(void *)(v3 + v4 + 40);
        if (!v13 && (sub_1A8A78588() & 1) == 0) {
          break;
        }
        if (v5 == v9 && v6 == v10)
        {
          if (v7 != v11) {
            return 0;
          }
        }
        else
        {
          char v15 = sub_1A8A78588();
          uint64_t result = 0;
          if ((v15 & 1) == 0 || v7 != v11) {
            return result;
          }
        }
        if (v8 >> 6)
        {
          if (v8 >> 6 == 1)
          {
            if ((v12 & 0xC0) != 0x40 || ((v12 ^ v8) & 0x3F) != 0) {
              return 0;
            }
          }
          else if (v12 != 128)
          {
            return 0;
          }
        }
        else if (v12 > 0x3F || v8 != v12)
        {
          return 0;
        }
        v4 += 40;
        --v2;
        a1 = v19;
        uint64_t v3 = a2;
        if (!v2) {
          return 1;
        }
      }
      return 0;
    }
  }
  return 1;
}

uint64_t sub_1A8A598E8(char a1)
{
  if (a1) {
    return 1886352499;
  }
  else {
    return 0x7472617473;
  }
}

uint64_t sub_1A8A59914()
{
  return sub_1A8A598E8(*v0);
}

uint64_t sub_1A8A5991C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8A5E970(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A8A59944()
{
  sub_1A8A5E7CC();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A59980()
{
  sub_1A8A5E7CC();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A599BC()
{
  sub_1A8A5E8C8();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A599F8()
{
  sub_1A8A5E8C8();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A59A34()
{
  sub_1A8A5E820();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A59A70()
{
  sub_1A8A5E820();
  return sub_1A8A78A58();
}

uint64_t DownloadRequest.encode(to:)(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v23 = a2;
  int v22 = a4;
  uint64_t v18 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747468);
  uint64_t v19 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  int v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747470);
  uint64_t v20 = *(void *)(v8 - 8);
  uint64_t v21 = v8;
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747460);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1_0(a1, a1[3]);
  sub_1A8A5E7CC();
  sub_1A8A78858();
  if (v22)
  {
    LOBYTE(v26) = 1;
    sub_1A8A5E820();
    sub_1A8A783C8();
    uint64_t v26 = v23;
    sub_1A8A5E874();
    sub_1A8A78468();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v5);
  }
  else
  {
    LOBYTE(v26) = 0;
    sub_1A8A5E8C8();
    sub_1A8A783C8();
    uint64_t v26 = v23;
    char v25 = 0;
    sub_1A8A5E874();
    uint64_t v15 = v21;
    uint64_t v16 = v24;
    sub_1A8A78468();
    if (!v16)
    {
      uint64_t v26 = v18;
      char v25 = 1;
      __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9746E48);
      sub_1A8A64010(&qword_1E9746E50, &qword_1E9746E48, (void (*)(void))sub_1A8A5E91C);
      sub_1A8A78468();
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

void *DownloadRequest.init(from:)(void *a1)
{
  uint64_t result = sub_1A8A5EA44(a1);
  if (v1) {
    return (void *)v3;
  }
  return result;
}

void *sub_1A8A59E70@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1A8A5EA44(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 16) = v6 & 1;
  }
  return result;
}

uint64_t sub_1A8A59EA4(void *a1)
{
  return DownloadRequest.encode(to:)(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned __int8 *)(v1 + 16));
}

uint64_t sub_1A8A59EC4(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 16))
  {
    if (*(void *)a1 == *(void *)a2) {
      return *(unsigned __int8 *)(a2 + 16);
    }
    else {
      return 0;
    }
  }
  else
  {
    if (*(void *)a1 == *(void *)a2) {
      char v3 = *(unsigned char *)(a2 + 16);
    }
    else {
      char v3 = 1;
    }
    if (v3) {
      return 0;
    }
    else {
      return sub_1A8A59798(*(void *)(a1 + 8), *(void *)(a2 + 8));
    }
  }
}

uint64_t DownloadRequest.ID.next.getter(uint64_t a1)
{
  BOOL v1 = __OFADD__(a1, 1);
  uint64_t result = a1 + 1;
  if (v1) {
    __break(1u);
  }
  return result;
}

BOOL static DownloadRequest.ID.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 < a2;
}

BOOL static DownloadRequest.ID.> infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a2 < a1;
}

uint64_t DownloadRequest.ID.init(from:)(uint64_t a1)
{
  sub_1A852BDA0(a1, (uint64_t)v4);
  uint64_t v2 = sub_1A8A770F8();
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v2;
}

uint64_t DownloadRequest.ID.encode(to:)()
{
  return sub_1A8A77108();
}

uint64_t sub_1A8A5A014@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1A852BDA0(a1, (uint64_t)v7);
  uint64_t v5 = sub_1A8A770F8();
  uint64_t result = __swift_destroy_boxed_opaque_existential_1(a1);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

uint64_t sub_1A8A5A07C()
{
  return sub_1A8A77108();
}

uint64_t sub_1A8A5A0D8()
{
  return sub_1A8A784D8();
}

uint64_t sub_1A8A5A124@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8A5F0E4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1A8A5A150()
{
  sub_1A8A5F03C();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A5A18C()
{
  sub_1A8A5F03C();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A5A1C8()
{
  sub_1A8A5F090();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A5A204()
{
  sub_1A8A5F090();
  return sub_1A8A78A58();
}

uint64_t CredentialRequest.encode(to:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a2;
  uint64_t v14 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F090);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  int v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F098);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1_0(a1, a1[3]);
  sub_1A8A5F03C();
  sub_1A8A78858();
  sub_1A8A5F090();
  sub_1A8A783C8();
  uint64_t v15 = v13;
  uint64_t v16 = v14;
  sub_1A8A5114C();
  sub_1A8A78468();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

void *CredentialRequest.init(from:)(void *a1)
{
  return sub_1A8A5F1A8(a1);
}

void *sub_1A8A5A464@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_1A8A5F1A8(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_1A8A5A490(void *a1)
{
  return CredentialRequest.encode(to:)(a1, *v1, v1[1]);
}

uint64_t sub_1A8A5A4B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8A5F620(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1A8A5A4DC()
{
  sub_1A8A5F524();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A5A518()
{
  sub_1A8A5F524();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A5A554()
{
  sub_1A8A5F578();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A5A590()
{
  sub_1A8A5F578();
  return sub_1A8A78A58();
}

uint64_t CredentialResponse.encode(to:)(void *a1, uint64_t a2)
{
  v13[0] = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747480);
  uint64_t v4 = *(void *)(v13[0] - 8);
  MEMORY[0x1F4188790](v13[0]);
  uint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747478);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1_0(a1, a1[3]);
  sub_1A8A5F524();
  sub_1A8A78858();
  sub_1A8A5F578();
  sub_1A8A783C8();
  v13[3] = a2;
  __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9746E38);
  sub_1A8A64010(&qword_1E9746E40, &qword_1E9746E38, (void (*)(void))sub_1A8A5F5CC);
  uint64_t v11 = v13[0];
  sub_1A8A78468();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v11);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void *CredentialResponse.init(from:)(void *a1)
{
  return sub_1A8A5F6D8(a1);
}

void *sub_1A8A5A82C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_1A8A5F6D8(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1A8A5A858(void *a1)
{
  return CredentialResponse.encode(to:)(a1, *v1);
}

uint64_t sub_1A8A5A874(uint64_t *a1, uint64_t *a2)
{
  return _s20IMAPSearchIndexerXPC18CredentialResponseO21__derived_enum_equalsySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t sub_1A8A5A880(char a1)
{
  if (!a1) {
    return 0x686372616573;
  }
  if (a1 == 1) {
    return 0xD000000000000015;
  }
  return 0xD000000000000012;
}

uint64_t sub_1A8A5A8D8(char a1)
{
  if (a1) {
    return 12639;
  }
  else {
    return 12383;
  }
}

uint64_t sub_1A8A5A8F0()
{
  return sub_1A8A5A880(*v0);
}

uint64_t sub_1A8A5A8F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8A5FCE8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A8A5A920()
{
  sub_1A8A5FA9C();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A5A95C()
{
  sub_1A8A5FA9C();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A5A998()
{
  return sub_1A8A5A8D8(*v0);
}

uint64_t sub_1A8A5A9A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8A5FE28(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A8A5A9C8()
{
  sub_1A8A5FAF0();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A5AA04()
{
  sub_1A8A5FAF0();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A5AA40()
{
  sub_1A8A5FBEC();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A5AA7C()
{
  sub_1A8A5FBEC();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A5AAB8()
{
  sub_1A8A5FC40();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A5AAF4()
{
  sub_1A8A5FC40();
  return sub_1A8A78A58();
}

uint64_t SearchRequest.encode(to:)(void *a1)
{
  uint64_t v2 = v1;
  sub_1A88EE118(v2, (uint64_t)v36);
  id v26 = (id)v36[0];
  *(void *)&long long v27 = v36[2];
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747450);
  uint64_t v29 = *(void *)(v30 - 8);
  MEMORY[0x1F4188790](v30);
  uint64_t v28 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747458);
  uint64_t v24 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747440);
  uint64_t v25 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747448);
  uint64_t v31 = *(void *)(v32 - 8);
  MEMORY[0x1F4188790](v32);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1_0(a1, a1[3]);
  sub_1A8A5FA9C();
  sub_1A8A78858();
  sub_1A88EE118(v2, (uint64_t)&v37);
  if (v40)
  {
    if (v40 == 1)
    {
      long long v27 = v37;
      uint64_t v14 = v38;
      uint64_t v13 = v39;
      LOBYTE(v34) = 2;
      sub_1A8A5FAF0();
      uint64_t v15 = v28;
      uint64_t v16 = v32;
      sub_1A8A783C8();
      long long v34 = v27;
      uint64_t v35 = v14;
      char v33 = 0;
      sub_1A8A5FB44();
      uint64_t v17 = v30;
      uint64_t v18 = v43;
      sub_1A8A78468();
      if (!v18)
      {
        *(void *)&long long v34 = v13;
        char v33 = 1;
        __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9746E60);
        sub_1A8A64010(&qword_1E974F0A8, &qword_1E9746E60, (void (*)(void))sub_1A8A5FB98);
        sub_1A8A78468();
      }
      (*(void (**)(char *, uint64_t))(v29 + 8))(v15, v17);
      return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v12, v16);
    }
    else
    {
      LOBYTE(v34) = 1;
      sub_1A8A5FBEC();
      uint64_t v22 = v32;
      sub_1A8A783C8();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v5);
      return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v12, v22);
    }
  }
  else
  {
    long long v41 = v37;
    uint64_t v42 = v38;
    LOBYTE(v34) = 0;
    sub_1A8A5FC40();
    id v20 = v26;
    _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
    uint64_t v21 = v32;
    sub_1A8A783C8();
    long long v34 = v41;
    uint64_t v35 = v42;
    sub_1A8A5FC94();
    sub_1A8A78468();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v8);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v21);
    return sub_1A8A64518((uint64_t)v2, (void (*)(void, void, void, void, void))sub_1A8A5C310);
  }
}

uint64_t SearchRequest.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1A8A5FEE4(a1, (uint64_t)v5);
  if (!v2) {
    return sub_1A88EE118(v5, a2);
  }
  return result;
}

uint64_t sub_1A8A5B118@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1A8A5FEE4(a1, (uint64_t)v5);
  if (!v2) {
    return sub_1A88EE118(v5, a2);
  }
  return result;
}

uint64_t sub_1A8A5B160(void *a1)
{
  sub_1A88EE118(v1, (uint64_t)v4);
  return SearchRequest.encode(to:)(a1);
}

BOOL sub_1A8A5B1B0(long long *a1, long long *a2)
{
  sub_1A88EE118(a1, (uint64_t)v4);
  sub_1A88EE118(a2, (uint64_t)v5);
  return _s20IMAPSearchIndexerXPC13SearchRequestO21__derived_enum_equalsySbAC_ACtFZ_0(v4, v5);
}

uint64_t sub_1A8A5B1FC(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(result + 64);
  int64_t v30 = (unint64_t)(v6 + 63) >> 6;
  while (v8)
  {
    unint64_t v9 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v10 = v9 | (v4 << 6);
LABEL_25:
    uint64_t v14 = (uint64_t *)(*(void *)(v3 + 48) + 24 * v10);
    uint64_t v16 = *v14;
    uint64_t v15 = (unsigned __int8 *)v14[1];
    uint64_t v17 = (unsigned __int8 *)v14[2];
    uint64_t v18 = *(void *)(*(void *)(v3 + 56) + 8 * v10);
    _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
    _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
    _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
    unint64_t v19 = sub_1A8A66F24(v16, v15, v17);
    char v21 = v20;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0
      || (uint64_t v22 = *(void *)(*(void *)(a2 + 56) + 8 * v19), v23 = *(void *)(v22 + 16), v23 != *(void *)(v18 + 16)))
    {
LABEL_37:
      swift_bridgeObjectRelease();
      return 0;
    }
    if (v23) {
      BOOL v24 = v22 == v18;
    }
    else {
      BOOL v24 = 1;
    }
    if (!v24)
    {
      if (*(_DWORD *)(v22 + 32) != *(_DWORD *)(v18 + 32)) {
        goto LABEL_37;
      }
      if (v23 != 1)
      {
        if (*(_DWORD *)(v22 + 36) != *(_DWORD *)(v18 + 36)) {
          goto LABEL_37;
        }
        uint64_t v25 = 0;
        uint64_t v26 = v22 + 40;
        uint64_t v27 = v23 - 2;
        while (v27 != v25)
        {
          int v28 = *(_DWORD *)(v26 + 4 * v25);
          int v29 = *(_DWORD *)(v18 + 4 * v25++ + 40);
          if (v28 != v29) {
            goto LABEL_37;
          }
        }
      }
    }
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v11 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_41;
  }
  if (v11 >= v30) {
    return 1;
  }
  unint64_t v12 = *(void *)(v5 + 8 * v11);
  ++v4;
  if (v12) {
    goto LABEL_24;
  }
  int64_t v4 = v11 + 1;
  if (v11 + 1 >= v30) {
    return 1;
  }
  unint64_t v12 = *(void *)(v5 + 8 * v4);
  if (v12) {
    goto LABEL_24;
  }
  int64_t v4 = v11 + 2;
  if (v11 + 2 >= v30) {
    return 1;
  }
  unint64_t v12 = *(void *)(v5 + 8 * v4);
  if (v12) {
    goto LABEL_24;
  }
  int64_t v4 = v11 + 3;
  if (v11 + 3 >= v30) {
    return 1;
  }
  unint64_t v12 = *(void *)(v5 + 8 * v4);
  if (v12)
  {
LABEL_24:
    unint64_t v8 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v4 << 6);
    goto LABEL_25;
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v30) {
    return 1;
  }
  unint64_t v12 = *(void *)(v5 + 8 * v13);
  if (v12)
  {
    int64_t v4 = v13;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v4 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v4 >= v30) {
      return 1;
    }
    unint64_t v12 = *(void *)(v5 + 8 * v4);
    ++v13;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1A8A5B470(char a1)
{
  if (!a1) {
    return 0x6552686372616573;
  }
  if (a1 == 1) {
    return 0xD000000000000012;
  }
  return 0x646564756C637865;
}

uint64_t sub_1A8A5B4E0()
{
  return sub_1A8A5B470(*v0);
}

uint64_t sub_1A8A5B4E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8A60814(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A8A5B510()
{
  sub_1A8A60610();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A5B54C()
{
  sub_1A8A60610();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A5B588()
{
  sub_1A8A60664();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A5B5C4()
{
  sub_1A8A60664();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A5B600()
{
  sub_1A8A606B8();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A5B63C()
{
  sub_1A8A606B8();
  return sub_1A8A78A58();
}

uint64_t sub_1A8A5B678()
{
  sub_1A8A6070C();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A5B6B4()
{
  sub_1A8A6070C();
  return sub_1A8A78A58();
}

uint64_t SearchResponse.encode(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v31 = a5;
  uint64_t v27 = a3;
  uint64_t v28 = a4;
  uint64_t v32 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F0B8);
  uint64_t v29 = *(void *)(v6 - 8);
  uint64_t v30 = v6;
  MEMORY[0x1F4188790](v6);
  unint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F0C0);
  uint64_t v25 = *(void *)(v9 - 8);
  uint64_t v26 = v9;
  MEMORY[0x1F4188790](v9);
  int64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F0C8);
  uint64_t v24 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F0D0);
  uint64_t v33 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1_0(a1, a1[3]);
  sub_1A8A60610();
  sub_1A8A78858();
  if ((_BYTE)v31)
  {
    if (v31 == 1)
    {
      LOBYTE(v34) = 1;
      sub_1A8A606B8();
      uint64_t v18 = v15;
      sub_1A8A783C8();
      uint64_t v34 = v32;
      uint64_t v35 = v27;
      uint64_t v36 = v28;
      sub_1A8A5CE28();
      uint64_t v19 = v26;
      sub_1A8A78468();
      char v20 = *(void (**)(char *, uint64_t))(v25 + 8);
      char v21 = v11;
    }
    else
    {
      LOBYTE(v34) = 2;
      sub_1A8A60664();
      uint64_t v18 = v15;
      sub_1A8A783C8();
      uint64_t v34 = v32;
      __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9746E60);
      sub_1A8A64010(&qword_1E974F0A8, &qword_1E9746E60, (void (*)(void))sub_1A8A5FB98);
      uint64_t v19 = v30;
      sub_1A8A78468();
      char v20 = *(void (**)(char *, uint64_t))(v29 + 8);
      char v21 = v8;
    }
    v20(v21, v19);
  }
  else
  {
    LOBYTE(v34) = 0;
    sub_1A8A6070C();
    uint64_t v18 = v15;
    sub_1A8A783C8();
    uint64_t v34 = v32;
    __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9746CB0);
    sub_1A8A60760();
    sub_1A8A78468();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v14, v12);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v17, v18);
}

uint64_t SearchResponse.init(from:)(uint64_t a1)
{
  return sub_1A8A5BB90(a1, (uint64_t (*)(void))sub_1A8A60984);
}

uint64_t sub_1A8A5BB90(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t result = a2();
  if (v2) {
    return v4;
  }
  return result;
}

uint64_t sub_1A8A5BBBC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1A8A60984(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
    *(unsigned char *)(a2 + 24) = v7;
  }
  return result;
}

uint64_t sub_1A8A5BBF0(void *a1)
{
  return SearchResponse.encode(to:)(a1, *(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(unsigned __int8 *)(v1 + 24));
}

uint64_t sub_1A8A5BC14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A8A5BC2C(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void, void, void))_s20IMAPSearchIndexerXPC14SearchResponseO21__derived_enum_equalsySbAC_ACtFZ_0);
}

uint64_t sub_1A8A5BC2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, void, void, void, void, void, void, void))
{
  return a5(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned __int8 *)(a1 + 24), *(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), *(unsigned __int8 *)(a2 + 24));
}

BOOL _s20IMAPSearchIndexerXPC13SearchRequestO21__derived_enum_equalsySbAC_ACtFZ_0(long long *a1, long long *a2)
{
  sub_1A88EE118(a1, (uint64_t)&v33);
  if (!v37)
  {
    int64_t v11 = v33;
    uint64_t v12 = v34;
    uint64_t v13 = v35;
    sub_1A88EE118(a2, (uint64_t)&v30);
    if (v32) {
      return 0;
    }
    int8x16_t v14 = v30;
    uint64_t v15 = v31.i64[0];
    id v38 = v11;
    uint64_t v39 = v30.i64[0];
    sub_1A8A644C0(&v38);
    _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
    sub_1A8A644C0((id *)&v39);
    _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
    id v16 = objc_msgSend(v11, sel_uniqueIdentifier);
    uint64_t v17 = sub_1A8A76558();
    uint64_t v19 = v18;

    id v20 = objc_msgSend((id)v14.i64[0], sel_uniqueIdentifier);
    uint64_t v21 = sub_1A8A76558();
    uint64_t v23 = v22;

    if (v17 == v21 && v19 == v23)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v27 = sub_1A8A78588();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v27 & 1) == 0) {
        goto LABEL_23;
      }
    }
    if (v12 == v14.i64[1])
    {
      char v28 = sub_1A8A59688(v13, v15);
      sub_1A8A644EC((id *)&v39);
      swift_bridgeObjectRelease();
      sub_1A8A644EC(&v38);
      swift_bridgeObjectRelease();
      return (v28 & 1) != 0;
    }
LABEL_23:
    sub_1A8A644EC((id *)&v39);
    swift_bridgeObjectRelease();
    sub_1A8A644EC(&v38);
    swift_bridgeObjectRelease();
    return 0;
  }
  if (v37 != 1)
  {
    sub_1A88EE118(a2, (uint64_t)&v30);
    int8x16_t v24 = vorrq_s8(v30, v31);
    int8x8_t v25 = vorr_s8(*(int8x8_t *)v24.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v24, v24, 8uLL));
    return v32 == 2 && *(void *)&v25 == 0;
  }
  uint64_t v4 = (uint64_t)v33;
  uint64_t v3 = v34;
  uint64_t v6 = v35;
  uint64_t v5 = v36;
  sub_1A88EE118(a2, (uint64_t)&v30);
  if (v32 != 1) {
    return 0;
  }
  uint64_t v7 = v30.i64[1];
  int8x16_t v8 = v31;
  if (!_s13IMAP2Protocol13EncodedStringV2eeoiySbAC_ACtFZ_0(v4, v30.i64[0])) {
    return 0;
  }
  if (v3 == v7 && v6 == v8.i64[0]) {
    return sub_1A8A5961C(v5, v8.i64[1]);
  }
  char v9 = sub_1A8A78588();
  BOOL v10 = 0;
  if (v9) {
    return sub_1A8A5961C(v5, v8.i64[1]);
  }
  return v10;
}

uint64_t _s20IMAPSearchIndexerXPC015MessageToSearchB0O21__derived_enum_equalsySbAC_ACtFZ_0(long long *a1, long long *a2)
{
  sub_1A88EE118(a1, (uint64_t)v17);
  int v4 = v18 >> 6;
  if (!v4)
  {
    v18 &= 0x3Fu;
    sub_1A8940A50(v17, (uint64_t)v13);
    sub_1A88EE118(a2, (uint64_t)v19);
    if (v20 <= 0x3Fu)
    {
      sub_1A8940A50(v19, (uint64_t)&v10);
      sub_1A8940A50(v13, (uint64_t)&v15);
      uint64_t v6 = v15;
      if (v16)
      {
        sub_1A8940A50(&v10, (uint64_t)v11);
        if (v12 != 1 || v6 != v11[0]) {
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v8 = *((void *)&v15 + 1);
        sub_1A8940A50(&v10, (uint64_t)v11);
        if ((v12 & 1) != 0 || v6 != v11[0] || (sub_1A8A59798(v8, v11[1]) & 1) == 0) {
          goto LABEL_16;
        }
      }
      char v5 = 1;
      return v5 & 1;
    }
LABEL_16:
    char v5 = 0;
    return v5 & 1;
  }
  if (v4 != 1)
  {
    v18 &= 0x3Fu;
    uint64_t v7 = *(void *)&v17[0];
    sub_1A88EE118(a2, (uint64_t)v19);
    if ((v20 & 0xC0) == 0x80)
    {
      v20 &= 0x3Fu;
      char v5 = _s20IMAPSearchIndexerXPC18CredentialResponseO21__derived_enum_equalsySbAC_ACtFZ_0(v7, *(uint64_t *)&v19[0]);
      return v5 & 1;
    }
    goto LABEL_16;
  }
  v18 &= 0x3Fu;
  sub_1A88EE118(v17, (uint64_t)v19);
  sub_1A88EE118(a2, (uint64_t)v13);
  if ((v14 & 0xC0) != 0x40) {
    goto LABEL_16;
  }
  v14 &= 0x3Fu;
  sub_1A88EE118(v13, (uint64_t)&v15);
  sub_1A8A64518((uint64_t)a1, (void (*)(void, void, void, void, void))sub_1A8A610D8);
  sub_1A8A64518((uint64_t)a2, (void (*)(void, void, void, void, void))sub_1A8A610D8);
  char v5 = _s20IMAPSearchIndexerXPC13SearchRequestO21__derived_enum_equalsySbAC_ACtFZ_0(v19, &v15);
  sub_1A8A64518((uint64_t)a2, (void (*)(void, void, void, void, void))sub_1A8A5C2D0);
  sub_1A8A64518((uint64_t)a1, (void (*)(void, void, void, void, void))sub_1A8A5C2D0);
  return v5 & 1;
}

unint64_t sub_1A8A5C0C0()
{
  unint64_t result = qword_1E9746490;
  if (!qword_1E9746490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746490);
  }
  return result;
}

unint64_t sub_1A8A5C114()
{
  unint64_t result = qword_1E97464C0;
  if (!qword_1E97464C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97464C0);
  }
  return result;
}

unint64_t sub_1A8A5C168()
{
  unint64_t result = qword_1E97467F0;
  if (!qword_1E97467F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97467F0);
  }
  return result;
}

void *sub_1A8A5C1BC(void *result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 == 1)
  {
    _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
    _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
  }
  else
  {
    if (a5) {
      return result;
    }
    id v5 = result;
  }
  return (void *)_s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
}

unint64_t sub_1A8A5C228()
{
  unint64_t result = qword_1E9746478;
  if (!qword_1E9746478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746478);
  }
  return result;
}

unint64_t sub_1A8A5C27C()
{
  unint64_t result = qword_1E9743298;
  if (!qword_1E9743298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9743298);
  }
  return result;
}

void *sub_1A8A5C2D0(void *result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  int v5 = a5 >> 6;
  if (v5 == 2) {
    return (void *)swift_bridgeObjectRelease();
  }
  if (v5 == 1) {
    return sub_1A8A5C310(result, a2, a3, a4, a5 & 0x3F);
  }
  if (!(a5 >> 6)) {
    return (void *)sub_1A8A5C300((uint64_t)result, a2, a3 & 1);
  }
  return result;
}

uint64_t sub_1A8A5C300(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_1A8A5C310(void *result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    if (a5) {
      return result;
    }
  }
  return (void *)swift_bridgeObjectRelease();
}

unint64_t sub_1A8A5C37C()
{
  unint64_t result = qword_1E97464A8;
  if (!qword_1E97464A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97464A8);
  }
  return result;
}

unint64_t sub_1A8A5C3D0()
{
  unint64_t result = qword_1E9746780;
  if (!qword_1E9746780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746780);
  }
  return result;
}

uint64_t _s20IMAPSearchIndexerXPC017MessageFromSearchB0O21__derived_enum_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned __int8 a8)
{
  switch(a4 >> 6)
  {
    case 1:
      if ((a8 & 0xC0) != 0x40) {
        goto LABEL_39;
      }
      int v9 = a8 & 0x3F;
      if ((a4 & 0x3F) != 0)
      {
        if ((a4 & 0x3F) == 1)
        {
          if (v9 == 1 && a1 == a5 && a2 == a6 && a3 == a7) {
            goto LABEL_9;
          }
        }
        else if (v9 == 2 && sub_1A8A5961C(a1, a5))
        {
          goto LABEL_9;
        }
      }
      else if (a8 & 0x3F) == 0 && (sub_1A8A5B1FC(a1, a5))
      {
        goto LABEL_9;
      }
      goto LABEL_39;
    case 2:
      if ((a8 & 0xC0) == 0x80)
      {
        if (a1 == a5 && a2 == a6)
        {
LABEL_9:
          uint64_t result = 1;
        }
        else
        {
          uint64_t result = sub_1A8A78588();
        }
      }
      else
      {
LABEL_39:
        uint64_t result = 0;
      }
      break;
    case 3:
      BOOL v12 = a1 == a5 && a2 == a6 && a3 == a7;
      uint64_t result = a8 > 0xBFu && v12;
      break;
    default:
      uint64_t result = a8 < 0x40u && a5 == a1;
      break;
  }
  return result;
}

uint64_t _s20IMAPSearchIndexerXPC14SearchResponseO21__derived_enum_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if (!a4)
  {
    if (!a8) {
      return sub_1A8A5B1FC(a1, a5);
    }
    return 0;
  }
  if (a4 != 1)
  {
    if (a8 == 2) {
      return sub_1A8A5961C(a1, a5);
    }
    return 0;
  }
  BOOL v10 = a1 == a5 && a2 == a6 && a3 == a7;
  return a8 == 1 && v10;
}

uint64_t sub_1A8A5C5C4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x64616F6C6E776F64 && a2 == 0xE800000000000000;
  if (v3 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x686372616573 && a2 == 0xE600000000000000 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x69746E6564657263 && a2 == 0xEB00000000736C61)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1A8A78588();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

double sub_1A8A5C714@<D0>(void *a1@<X0>, __n128 *a2@<X8>)
{
  id v38 = a2;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F238);
  uint64_t v37 = *(void *)(v33 - 8);
  MEMORY[0x1F4188790](v33);
  uint64_t v39 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F240);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v35 = v4;
  uint64_t v36 = v5;
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F248);
  uint64_t v34 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  BOOL v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F250);
  unint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  char v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = a1[3];
  uint64_t v45 = a1;
  __swift_project_boxed_opaque_existential_1_0(a1, v15);
  sub_1A8A5C0C0();
  unint64_t v16 = v40.n128_u64[0];
  sub_1A8A78828();
  if (v16) {
    goto LABEL_9;
  }
  uint64_t v17 = v39;
  v40.n128_u64[0] = v12;
  uint64_t v18 = sub_1A8A783B8();
  if (*(void *)(v18 + 16) != 1)
  {
    uint64_t v23 = sub_1A8A77E58();
    swift_allocError();
    int8x16_t v24 = v14;
    uint64_t v26 = v25;
    __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974EF38);
    *uint64_t v26 = &type metadata for MessageToSearchIndexer;
    sub_1A8A78318();
    sub_1A8A77E48();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v23 - 8) + 104))(v26, *MEMORY[0x1E4FBBA70], v23);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v40.n128_u64[0] + 8))(v24, v11);
LABEL_9:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
    return result;
  }
  if (*(unsigned char *)(v18 + 32))
  {
    if (*(unsigned char *)(v18 + 32) == 1)
    {
      v41.n128_u8[0] = 1;
      sub_1A8A5C228();
      sub_1A8A78308();
      sub_1A8A64288();
      uint64_t v19 = v35;
      sub_1A8A78378();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v7, v19);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v40.n128_u64[0] + 8))(v14, v11);
      __n128 v40 = v41;
      unint64_t v21 = v42;
      unint64_t v20 = v43;
      char v22 = v44 | 0x40;
    }
    else
    {
      v41.n128_u8[0] = 2;
      sub_1A8A5C114();
      sub_1A8A78308();
      sub_1A8A64234();
      uint64_t v28 = v33;
      sub_1A8A78378();
      unint64_t v29 = v40.n128_u64[0];
      (*(void (**)(char *, uint64_t))(v37 + 8))(v17, v28);
      swift_bridgeObjectRelease();
      __n128 v30 = ((__n128 (*)(char *, uint64_t))*(void *)(v29 + 8))(v14, v11);
      unint64_t v21 = 0;
      unint64_t v20 = 0;
      v30.n128_u64[0] = v41.n128_u64[0];
      __n128 v40 = v30;
      char v22 = 0x80;
    }
  }
  else
  {
    v41.n128_u8[0] = 0;
    sub_1A8A5C37C();
    sub_1A8A78308();
    sub_1A8A642DC();
    sub_1A8A78378();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v8);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v40.n128_u64[0] + 8))(v14, v11);
    unint64_t v20 = 0;
    char v22 = 0;
    __n128 v40 = v41;
    unint64_t v21 = v42;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  int8x16_t v31 = v38;
  double result = v40.n128_f64[0];
  *id v38 = v40;
  v31[1].n128_u64[0] = v21;
  v31[1].n128_u64[1] = v20;
  v31[2].n128_u8[0] = v22;
  return result;
}

unint64_t sub_1A8A5CD80()
{
  unint64_t result = qword_1E97464F8;
  if (!qword_1E97464F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97464F8);
  }
  return result;
}

unint64_t sub_1A8A5CDD4()
{
  unint64_t result = qword_1E9746540;
  if (!qword_1E9746540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746540);
  }
  return result;
}

unint64_t sub_1A8A5CE28()
{
  unint64_t result = qword_1E974F010;
  if (!qword_1E974F010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F010);
  }
  return result;
}

unint64_t sub_1A8A5CE7C()
{
  unint64_t result = qword_1E9746528;
  if (!qword_1E9746528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746528);
  }
  return result;
}

unint64_t sub_1A8A5CED0()
{
  unint64_t result = qword_1E974F018;
  if (!qword_1E974F018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F018);
  }
  return result;
}

unint64_t sub_1A8A5CF24()
{
  unint64_t result = qword_1E97464E0;
  if (!qword_1E97464E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97464E0);
  }
  return result;
}

unint64_t sub_1A8A5CF78()
{
  unint64_t result = qword_1E974F020;
  if (!qword_1E974F020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F020);
  }
  return result;
}

unint64_t sub_1A8A5CFCC()
{
  unint64_t result = qword_1E9746510;
  if (!qword_1E9746510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746510);
  }
  return result;
}

unint64_t sub_1A8A5D020()
{
  unint64_t result = qword_1E974F028;
  if (!qword_1E974F028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F028);
  }
  return result;
}

uint64_t sub_1A8A5D074(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x64616F6C6E776F64 && a2 == 0xE800000000000000;
  if (v3 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x686372616573 && a2 == 0xE600000000000000 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x69746E6564657263 && a2 == 0xEB00000000736C61 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x80000001A8B409E0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_1A8A78588();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_1A8A5D21C(void *a1)
{
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747358);
  uint64_t v48 = *(void *)(v44 - 8);
  MEMORY[0x1F4188790](v44);
  uint64_t v47 = (char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747350);
  uint64_t v45 = *(void *)(v43 - 8);
  MEMORY[0x1F4188790](v43);
  uint64_t v46 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747338);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v41 = v4;
  uint64_t v42 = v5;
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747348);
  uint64_t v40 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  BOOL v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747340);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  char v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  uint64_t v15 = a1[4];
  uint64_t v49 = a1;
  __swift_project_boxed_opaque_existential_1_0(a1, v16);
  sub_1A8A5CD80();
  uint64_t v17 = v51;
  sub_1A8A78828();
  if (!v17)
  {
    uint64_t v18 = v10;
    uint64_t v38 = v8;
    uint64_t v39 = 0;
    uint64_t v19 = v46;
    unint64_t v20 = v47;
    uint64_t v21 = v48;
    uint64_t v51 = v12;
    uint64_t v22 = sub_1A8A783B8();
    if (*(void *)(v22 + 16) == 1)
    {
      switch(*(unsigned char *)(v22 + 32))
      {
        case 1:
          LOBYTE(v50) = 1;
          sub_1A8A5CF24();
          uint64_t v28 = v39;
          sub_1A8A78308();
          uint64_t v15 = v28;
          if (v28) {
            goto LABEL_12;
          }
          sub_1A8A6418C();
          uint64_t v29 = v41;
          sub_1A8A78378();
          (*(void (**)(char *, uint64_t))(v42 + 8))(v7, v29);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v51 + 8))(v14, v11);
          uint64_t v15 = v50;
          break;
        case 2:
          LOBYTE(v50) = 2;
          sub_1A8A5CE7C();
          __n128 v30 = v19;
          uint64_t v31 = v39;
          sub_1A8A78308();
          uint64_t v15 = v31;
          if (v31) {
            goto LABEL_12;
          }
          sub_1A8A64138();
          uint64_t v32 = v43;
          sub_1A8A78378();
          uint64_t v33 = v51;
          (*(void (**)(char *, uint64_t))(v45 + 8))(v30, v32);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v11);
          uint64_t v15 = v50;
          break;
        case 3:
          LOBYTE(v50) = 3;
          sub_1A8A5CDD4();
          uint64_t v34 = v39;
          sub_1A8A78308();
          uint64_t v15 = v34;
          if (v34) {
            goto LABEL_12;
          }
          sub_1A8A63DB8();
          uint64_t v36 = v44;
          sub_1A8A78378();
          uint64_t v37 = v51;
          (*(void (**)(char *, uint64_t))(v21 + 8))(v20, v36);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v37 + 8))(v14, v11);
          uint64_t v15 = v50;
          break;
        default:
          LOBYTE(v50) = 0;
          sub_1A8A5CFCC();
          uint64_t v23 = v18;
          uint64_t v24 = v39;
          sub_1A8A78308();
          uint64_t v15 = v24;
          if (v24)
          {
LABEL_12:
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v51 + 8))(v14, v11);
          }
          else
          {
            sub_1A8A641E0();
            uint64_t v25 = v38;
            sub_1A8A78378();
            (*(void (**)(char *, uint64_t))(v40 + 8))(v23, v25);
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v51 + 8))(v14, v11);
            uint64_t v15 = v50;
          }
          break;
      }
    }
    else
    {
      uint64_t v15 = sub_1A8A77E58();
      swift_allocError();
      char v27 = v26;
      __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974EF38);
      *char v27 = &type metadata for MessageFromSearchIndexer;
      sub_1A8A78318();
      sub_1A8A77E48();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v15 - 8) + 104))(v27, *MEMORY[0x1E4FBBA70], v15);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v14, v11);
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v49);
  return v15;
}

uint64_t sub_1A8A5DA58()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A8A5DA90(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(v1 + 16))(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned __int8 *)(a1 + 24) | (*(unsigned __int8 *)(a1 + 25) << 8));
}

unint64_t sub_1A8A5DAD8()
{
  unint64_t result = qword_1E97464D8;
  if (!qword_1E97464D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97464D8);
  }
  return result;
}

unint64_t sub_1A8A5DB2C()
{
  unint64_t result = qword_1E9746558;
  if (!qword_1E9746558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746558);
  }
  return result;
}

uint64_t sub_1A8A5DB80(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(unsigned char *))(v1 + 16);
  sub_1A8A640D0(a1, (uint64_t)v4);
  return v2(v4);
}

unint64_t sub_1A8A5DBBC()
{
  unint64_t result = qword_1E974F030;
  if (!qword_1E974F030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F030);
  }
  return result;
}

unint64_t sub_1A8A5DC10()
{
  unint64_t result = qword_1E974F038;
  if (!qword_1E974F038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F038);
  }
  return result;
}

unint64_t sub_1A8A5DC64()
{
  unint64_t result = qword_1E9746708;
  if (!qword_1E9746708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746708);
  }
  return result;
}

unint64_t sub_1A8A5DCB8()
{
  unint64_t result = qword_1E974F070;
  if (!qword_1E974F070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F070);
  }
  return result;
}

unint64_t sub_1A8A5DD0C()
{
  unint64_t result = qword_1E974F078;
  if (!qword_1E974F078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F078);
  }
  return result;
}

unint64_t sub_1A8A5DD60()
{
  unint64_t result = qword_1E974F080;
  if (!qword_1E974F080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F080);
  }
  return result;
}

unint64_t sub_1A8A5DDB4()
{
  unint64_t result = qword_1E974F088;
  if (!qword_1E974F088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F088);
  }
  return result;
}

unint64_t sub_1A8A5DE08()
{
  unint64_t result = qword_1E9746730;
  if (!qword_1E9746730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746730);
  }
  return result;
}

uint64_t sub_1A8A5DE5C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7265666544646964 && a2 == 0xE800000000000000;
  if (v3 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F43746F4E646964 && a2 == 0xEE006574656C706DLL || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000001A8B40A00 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6C706D6F43646964 && a2 == 0xEB00000000657465 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6572756C696166 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_1A8A78588();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_1A8A5E084(void *a1)
{
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747388);
  uint64_t v34 = *(void *)(v41 - 8);
  MEMORY[0x1F4188790](v41);
  uint64_t v44 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747398);
  uint64_t v40 = *(void *)(v37 - 8);
  MEMORY[0x1F4188790](v37);
  uint64_t v43 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E97473A8);
  uint64_t v38 = *(void *)(v4 - 8);
  uint64_t v39 = v4;
  MEMORY[0x1F4188790](v4);
  uint64_t v42 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E97473A0);
  uint64_t v35 = *(void *)(v6 - 8);
  uint64_t v36 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747390);
  uint64_t v33 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747380);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (uint64_t)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  uint64_t v45 = a1;
  __swift_project_boxed_opaque_existential_1_0(a1, v16);
  sub_1A8A5DC64();
  uint64_t v17 = v46;
  sub_1A8A78828();
  if (!v17)
  {
    uint64_t v46 = v11;
    uint64_t v31 = v9;
    uint64_t v32 = v13;
    uint64_t v18 = v8;
    unint64_t v20 = v42;
    uint64_t v19 = v43;
    uint64_t v21 = v44;
    uint64_t v22 = v15;
    uint64_t v23 = sub_1A8A783B8();
    if (*(void *)(v23 + 16) == 1)
    {
      uint64_t v15 = *(unsigned __int8 *)(v23 + 32);
      switch(*(unsigned char *)(v23 + 32))
      {
        case 1:
          uint64_t v30 = v32;
          char v48 = 1;
          sub_1A8A5DDB4();
          sub_1A8A78308();
          (*(void (**)(char *, uint64_t))(v35 + 8))(v18, v36);
          goto LABEL_12;
        case 2:
          uint64_t v30 = v32;
          char v49 = 2;
          sub_1A8A5DD60();
          sub_1A8A78308();
          (*(void (**)(char *, uint64_t))(v38 + 8))(v20, v39);
LABEL_12:
          swift_bridgeObjectRelease();
          uint64_t v24 = v30;
          goto LABEL_10;
        case 3:
          uint64_t v24 = v32;
          char v50 = 3;
          sub_1A8A5DD0C();
          sub_1A8A78308();
          (*(void (**)(char *, uint64_t))(v40 + 8))(v19, v37);
          goto LABEL_13;
        case 4:
          char v51 = 4;
          sub_1A8A5DCB8();
          sub_1A8A78308();
          (*(void (**)(char *, uint64_t))(v34 + 8))(v21, v41);
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v22, v12);
          break;
        default:
          uint64_t v24 = v32;
          char v47 = 0;
          sub_1A8A5DE08();
          uint64_t v25 = v46;
          sub_1A8A78308();
          (*(void (**)(char *, uint64_t))(v33 + 8))(v25, v31);
LABEL_13:
          swift_bridgeObjectRelease();
LABEL_10:
          (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v12);
          break;
      }
    }
    else
    {
      uint64_t v26 = sub_1A8A77E58();
      uint64_t v15 = swift_allocError();
      uint64_t v28 = v27;
      __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974EF38);
      *uint64_t v28 = &type metadata for DownloadRequest.Response;
      sub_1A8A78318();
      sub_1A8A77E48();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x1E4FBBA70], v26);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v22, v12);
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  return v15;
}

unint64_t sub_1A8A5E7CC()
{
  unint64_t result = qword_1E97466B8;
  if (!qword_1E97466B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97466B8);
  }
  return result;
}

unint64_t sub_1A8A5E820()
{
  unint64_t result = qword_1E97466D0;
  if (!qword_1E97466D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97466D0);
  }
  return result;
}

unint64_t sub_1A8A5E874()
{
  unint64_t result = qword_1E9746700;
  if (!qword_1E9746700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746700);
  }
  return result;
}

unint64_t sub_1A8A5E8C8()
{
  unint64_t result = qword_1E97466E8;
  if (!qword_1E97466E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97466E8);
  }
  return result;
}

unint64_t sub_1A8A5E91C()
{
  unint64_t result = qword_1E97468F8;
  if (!qword_1E97468F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97468F8);
  }
  return result;
}

uint64_t sub_1A8A5E970(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7472617473 && a2 == 0xE500000000000000;
  if (v3 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1886352499 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1A8A78588();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

void *sub_1A8A5EA44(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F200);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v27 = v2;
  uint64_t v28 = v3;
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v6 = (void *)__swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F208);
  uint64_t v29 = *(v6 - 1);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F210);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[3];
  uint64_t v30 = a1;
  __swift_project_boxed_opaque_existential_1_0(a1, v13);
  sub_1A8A5E7CC();
  uint64_t v14 = v31;
  sub_1A8A78828();
  if (v14) {
    goto LABEL_7;
  }
  uint64_t v31 = v10;
  uint64_t v15 = sub_1A8A783B8();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v18 = sub_1A8A77E58();
    swift_allocError();
    char v6 = v19;
    __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974EF38);
    *char v6 = &type metadata for DownloadRequest;
    sub_1A8A78318();
    sub_1A8A77E48();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v6, *MEMORY[0x1E4FBBA70], v18);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v9);
LABEL_7:
    uint64_t v23 = (uint64_t)v30;
    goto LABEL_8;
  }
  int v16 = *(unsigned __int8 *)(v15 + 32);
  if (v16)
  {
    LOBYTE(v34) = 1;
    sub_1A8A5E820();
    uint64_t v17 = v5;
    sub_1A8A78308();
    sub_1A8A63FBC();
    uint64_t v22 = v27;
    sub_1A8A78378();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v17, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v9);
    char v6 = v34;
  }
  else
  {
    LOBYTE(v34) = 0;
    sub_1A8A5E8C8();
    sub_1A8A78308();
    LOBYTE(v33) = 0;
    sub_1A8A63FBC();
    uint64_t v21 = v8;
    sub_1A8A78378();
    LODWORD(v28) = v16;
    uint64_t v24 = v6;
    char v6 = v34;
    __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9746E48);
    char v32 = 1;
    sub_1A8A64010(&qword_1E974F220, &qword_1E9746E48, (void (*)(void))sub_1A8A6407C);
    sub_1A8A78378();
    uint64_t v25 = v31;
    (*(void (**)(char *, void *))(v29 + 8))(v21, v24);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v9);
  }
  uint64_t v23 = (uint64_t)v30;
LABEL_8:
  __swift_destroy_boxed_opaque_existential_1(v23);
  return v6;
}

unint64_t sub_1A8A5F03C()
{
  unint64_t result = qword_1E9746788;
  if (!qword_1E9746788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746788);
  }
  return result;
}

unint64_t sub_1A8A5F090()
{
  unint64_t result = qword_1E97467A0;
  if (!qword_1E97467A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97467A0);
  }
  return result;
}

uint64_t sub_1A8A5F0E4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x64657243656B616DLL && a2 == 0xEF736C6169746E65)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1A8A78588();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1A8A5F184()
{
  return 0x64657243656B616DLL;
}

void *sub_1A8A5F1A8(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E97473B8);
  uint64_t v20 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E97473B0);
  uint64_t v6 = *(void *)(v22 - 8);
  MEMORY[0x1F4188790](v22);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_project_boxed_opaque_existential_1_0(a1, a1[3]);
  sub_1A8A5F03C();
  sub_1A8A78828();
  if (v1) {
    goto LABEL_5;
  }
  uint64_t v18 = a1;
  uint64_t v19 = v6;
  uint64_t v10 = v22;
  if (*(void *)(sub_1A8A783B8() + 16) != 1)
  {
    uint64_t v12 = v10;
    uint64_t v13 = sub_1A8A77E58();
    swift_allocError();
    uint64_t v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974EF38);
    *uint64_t v15 = &type metadata for CredentialRequest;
    uint64_t v9 = v8;
    sub_1A8A78318();
    sub_1A8A77E48();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x1E4FBBA70], v13);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v12);
    a1 = v18;
LABEL_5:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v9;
  }
  sub_1A8A5F090();
  sub_1A8A78308();
  uint64_t v11 = v19;
  sub_1A8A52924();
  sub_1A8A78378();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v3);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  uint64_t v9 = v21;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  return v9;
}

unint64_t sub_1A8A5F524()
{
  unint64_t result = qword_1E97467C0;
  if (!qword_1E97467C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97467C0);
  }
  return result;
}

unint64_t sub_1A8A5F578()
{
  unint64_t result = qword_1E97467D8;
  if (!qword_1E97467D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97467D8);
  }
  return result;
}

unint64_t sub_1A8A5F5CC()
{
  unint64_t result = qword_1E97465E0;
  if (!qword_1E97465E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97465E0);
  }
  return result;
}

uint64_t sub_1A8A5F620(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x69746E6564657263 && a2 == 0xEB00000000736C61)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1A8A78588();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1A8A5F6B8()
{
  return 0x69746E6564657263;
}

void *sub_1A8A5F6D8(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F1E0);
  uint64_t v18 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F1E8);
  uint64_t v6 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v19);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_project_boxed_opaque_existential_1_0(a1, a1[3]);
  sub_1A8A5F524();
  sub_1A8A78828();
  if (v1) {
    goto LABEL_5;
  }
  int v16 = a1;
  uint64_t v17 = v6;
  uint64_t v10 = v19;
  if (*(void *)(sub_1A8A783B8() + 16) != 1)
  {
    uint64_t v12 = sub_1A8A77E58();
    swift_allocError();
    uint64_t v14 = v13;
    __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974EF38);
    void *v14 = &type metadata for CredentialResponse;
    uint64_t v9 = v8;
    sub_1A8A78318();
    sub_1A8A77E48();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v12 - 8) + 104))(v14, *MEMORY[0x1E4FBBA70], v12);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v8, v10);
    a1 = v16;
LABEL_5:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v9;
  }
  sub_1A8A5F578();
  sub_1A8A78308();
  uint64_t v11 = v17;
  __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9746E38);
  sub_1A8A64010(&qword_1E974F1F0, &qword_1E9746E38, (void (*)(void))sub_1A8A63F68);
  sub_1A8A78378();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v5, v3);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  uint64_t v9 = v20;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  return v9;
}

unint64_t sub_1A8A5FA9C()
{
  unint64_t result = qword_1E9746620;
  if (!qword_1E9746620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746620);
  }
  return result;
}

unint64_t sub_1A8A5FAF0()
{
  unint64_t result = qword_1E974F0A0;
  if (!qword_1E974F0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F0A0);
  }
  return result;
}

unint64_t sub_1A8A5FB44()
{
  unint64_t result = qword_1E9746950;
  if (!qword_1E9746950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746950);
  }
  return result;
}

unint64_t sub_1A8A5FB98()
{
  unint64_t result = qword_1E974F0B0;
  if (!qword_1E974F0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F0B0);
  }
  return result;
}

unint64_t sub_1A8A5FBEC()
{
  unint64_t result = qword_1E9746648;
  if (!qword_1E9746648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746648);
  }
  return result;
}

unint64_t sub_1A8A5FC40()
{
  unint64_t result = qword_1E9746608;
  if (!qword_1E9746608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746608);
  }
  return result;
}

unint64_t sub_1A8A5FC94()
{
  unint64_t result = qword_1E9746600;
  if (!qword_1E9746600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746600);
  }
  return result;
}

uint64_t sub_1A8A5FCE8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x686372616573 && a2 == 0xE600000000000000;
  if (v3 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000001A8B40A20 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001A8B40A40)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1A8A78588();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1A8A5FE28(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 12383 && a2 == 0xE200000000000000;
  if (v3 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 12639 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1A8A78588();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A8A5FEE4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v39 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F1B8);
  uint64_t v37 = *(void *)(v3 - 8);
  uint64_t v38 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v41 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F1C0);
  uint64_t v40 = *(char **)(v35 - 8);
  MEMORY[0x1F4188790](v35);
  char v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F1C8);
  uint64_t v36 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F1D0);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[3];
  uint64_t v42 = a1;
  __swift_project_boxed_opaque_existential_1_0(a1, v14);
  sub_1A8A5FA9C();
  uint64_t v15 = v43;
  sub_1A8A78828();
  if (v15) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  }
  uint64_t v34 = v7;
  uint64_t v17 = v40;
  int v16 = v41;
  uint64_t v43 = v11;
  uint64_t v18 = sub_1A8A783B8();
  uint64_t v19 = v18;
  if (*(void *)(v18 + 16) != 1)
  {
    uint64_t v25 = sub_1A8A77E58();
    swift_allocError();
    uint64_t v27 = v26;
    __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974EF38);
    *uint64_t v27 = &type metadata for SearchRequest;
    sub_1A8A78318();
    sub_1A8A77E48();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v25 - 8) + 104))(v27, *MEMORY[0x1E4FBBA70], v25);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v13, v10);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  }
  if (*(unsigned char *)(v18 + 32))
  {
    if (*(unsigned char *)(v18 + 32) == 1)
    {
      LOBYTE(v45) = 1;
      sub_1A8A5FBEC();
      sub_1A8A78308();
      (*((void (**)(char *, uint64_t))v17 + 1))(v6, v35);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v13, v10);
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      char v24 = 2;
    }
    else
    {
      LOBYTE(v45) = 2;
      sub_1A8A5FAF0();
      sub_1A8A78308();
      LOBYTE(v48) = 0;
      sub_1A8A63EC0();
      uint64_t v30 = v16;
      sub_1A8A78378();
      uint64_t v36 = v19;
      uint64_t v40 = v13;
      uint64_t v20 = v45;
      uint64_t v21 = v46;
      uint64_t v22 = v47;
      __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9746E60);
      char v44 = 1;
      uint64_t v31 = v38;
      sub_1A8A64010(&qword_1E9746E68, &qword_1E9746E60, (void (*)(void))sub_1A8A63D64);
      sub_1A8A78378();
      uint64_t v32 = v43;
      (*(void (**)(char *, uint64_t))(v37 + 8))(v30, v31);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v40, v10);
      uint64_t v23 = v48;
      char v24 = 1;
    }
  }
  else
  {
    LOBYTE(v45) = 0;
    sub_1A8A5FC40();
    sub_1A8A78308();
    sub_1A8A63F14();
    uint64_t v28 = v34;
    sub_1A8A78378();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v9, v28);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v13, v10);
    uint64_t v23 = 0;
    char v24 = 0;
    uint64_t v20 = v45;
    uint64_t v21 = v46;
    uint64_t v22 = v47;
  }
  uint64_t v33 = v39;
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  *(void *)uint64_t v33 = v20;
  *(void *)(v33 + 8) = v21;
  *(void *)(v33 + 16) = v22;
  *(void *)(v33 + 24) = v23;
  *(unsigned char *)(v33 + 32) = v24;
  return result;
}

unint64_t sub_1A8A60610()
{
  unint64_t result = qword_1E9746678;
  if (!qword_1E9746678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746678);
  }
  return result;
}

unint64_t sub_1A8A60664()
{
  unint64_t result = qword_1E974F0D8;
  if (!qword_1E974F0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F0D8);
  }
  return result;
}

unint64_t sub_1A8A606B8()
{
  unint64_t result = qword_1E97466A0;
  if (!qword_1E97466A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97466A0);
  }
  return result;
}

unint64_t sub_1A8A6070C()
{
  unint64_t result = qword_1E9746660;
  if (!qword_1E9746660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746660);
  }
  return result;
}

unint64_t sub_1A8A60760()
{
  unint64_t result = qword_1E974F0E0;
  if (!qword_1E974F0E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract_0(&qword_1E9746CB0);
    sub_1A8A5FB44();
    sub_1A8A64010(&qword_1E974F0A8, &qword_1E9746E60, (void (*)(void))sub_1A8A5FB98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F0E0);
  }
  return result;
}

uint64_t sub_1A8A60814(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6552686372616573 && a2 == 0xED000073746C7573;
  if (v3 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001A8B40A60 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x646564756C637865 && a2 == 0xEC00000073444955)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1A8A78588();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1A8A60984(void *a1)
{
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747370);
  uint64_t v28 = *(void *)(v30 - 8);
  MEMORY[0x1F4188790](v30);
  uint64_t v32 = (char *)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747378);
  uint64_t v27 = *(void *)(v31 - 8);
  MEMORY[0x1F4188790](v31);
  uint64_t v4 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747360);
  uint64_t v29 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747368);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1[3];
  uint64_t v33 = a1;
  __swift_project_boxed_opaque_existential_1_0(a1, v12);
  sub_1A8A60610();
  uint64_t v13 = v35;
  sub_1A8A78828();
  if (!v13)
  {
    uint64_t v26 = v5;
    uint64_t v14 = v31;
    uint64_t v15 = v32;
    uint64_t v35 = v9;
    uint64_t v16 = sub_1A8A783B8();
    if (*(void *)(v16 + 16) != 1)
    {
      uint64_t v5 = sub_1A8A77E58();
      swift_allocError();
      uint64_t v20 = v19;
      __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974EF38);
      *uint64_t v20 = &type metadata for SearchResponse;
      sub_1A8A78318();
      sub_1A8A77E48();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v5 - 8) + 104))(v20, *MEMORY[0x1E4FBBA70], v5);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v11, v8);
      goto LABEL_7;
    }
    int v17 = *(unsigned __int8 *)(v16 + 32);
    v25[1] = v17;
    if (v17)
    {
      if (v17 == 1)
      {
        LOBYTE(v34) = 1;
        sub_1A8A606B8();
        sub_1A8A78308();
        sub_1A8A63DB8();
        sub_1A8A78378();
        uint64_t v18 = v35;
        (*(void (**)(char *, uint64_t))(v27 + 8))(v4, v14);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v18 + 8))(v11, v8);
        uint64_t v5 = v34;
        goto LABEL_7;
      }
      LOBYTE(v34) = 2;
      sub_1A8A60664();
      sub_1A8A78308();
      __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9746E60);
      sub_1A8A64010(&qword_1E9746E68, &qword_1E9746E60, (void (*)(void))sub_1A8A63D64);
      uint64_t v24 = v30;
      sub_1A8A78378();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v15, v24);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v11, v8);
    }
    else
    {
      LOBYTE(v34) = 0;
      sub_1A8A6070C();
      uint64_t v22 = v7;
      sub_1A8A78308();
      __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9746CB0);
      sub_1A8A63E0C();
      uint64_t v23 = v26;
      sub_1A8A78378();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v22, v23);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v11, v8);
    }
    uint64_t v5 = v34;
  }
LABEL_7:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  return v5;
}

unint64_t sub_1A8A6102C()
{
  unint64_t result = qword_1E974F0E8;
  if (!qword_1E974F0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F0E8);
  }
  return result;
}

unint64_t sub_1A8A61084()
{
  unint64_t result = qword_1E974F0F0;
  if (!qword_1E974F0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F0F0);
  }
  return result;
}

void *sub_1A8A610D8(void *result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  int v5 = a5 >> 6;
  if (v5 == 2) {
    return (void *)_s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
  }
  if (v5 == 1) {
    return sub_1A8A5C1BC(result, a2, a3, a4, a5 & 0x3F);
  }
  if (!(a5 >> 6)) {
    return (void *)sub_1A8A61108((uint64_t)result, a2, a3 & 1);
  }
  return result;
}

uint64_t sub_1A8A61108(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
  }
  return result;
}

uint64_t destroy for MessageToSearchIndexer(uint64_t a1, uint64_t a2)
{
  return sub_1A8A61670(a1, a2, (uint64_t (*)(void, void, void, void, void))sub_1A8A5C2D0);
}

uint64_t initializeWithCopy for MessageToSearchIndexer(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_1A8A616A4(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))sub_1A8A610D8);
}

uint64_t *assignWithCopy for MessageToSearchIndexer(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_1A8A6173C(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))sub_1A8A610D8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1A8A5C2D0);
}

__n128 __swift_memcpy33_8_4(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t *assignWithTake for MessageToSearchIndexer(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1A8A617E0(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1A8A5C2D0);
}

uint64_t getEnumTagSinglePayload for MessageToSearchIndexer(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x3E && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 62);
  }
  unsigned int v3 = (*(unsigned char *)(a1 + 32) & 0x3C | (*(unsigned __int8 *)(a1 + 32) >> 6)) ^ 0x3F;
  if (v3 >= 0x3D) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for MessageToSearchIndexer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3D)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 62;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x3E) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0x3E) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2)
    {
      *(_OWORD *)__n128 result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(unsigned char *)(result + 32) = 4 * (((-a2 >> 2) & 0xF) - 16 * a2);
    }
  }
  return result;
}

uint64_t sub_1A8A6124C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32) >> 6;
}

uint64_t sub_1A8A61258(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = *(unsigned char *)(result + 32) & 3 | (a2 << 6);
  return result;
}

ValueMetadata *type metadata accessor for MessageToSearchIndexer()
{
  return &type metadata for MessageToSearchIndexer;
}

uint64_t sub_1A8A6127C(uint64_t result, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  int v4 = a4 >> 6;
  if (v4 == 2) {
    return _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
  }
  if (v4 == 1) {
    return sub_1A8A612A4(result, a2, a3, a4 & 0x3F);
  }
  return result;
}

uint64_t sub_1A8A612A4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if ((a4 | 2) == 2) {
    return _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
  }
  return result;
}

uint64_t destroy for MessageFromSearchIndexer(uint64_t a1)
{
  return sub_1A8A612D0(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
}

uint64_t sub_1A8A612D0(uint64_t result, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  int v4 = a4 >> 6;
  if (v4 == 2) {
    return swift_bridgeObjectRelease();
  }
  if (v4 == 1) {
    return sub_1A8A612F8(result, a2, a3, a4 & 0x3F);
  }
  return result;
}

uint64_t sub_1A8A612F8(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if ((a4 | 2) == 2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for MessageFromSearchIndexer(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_1A8A61870(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t))sub_1A8A6127C);
}

uint64_t *assignWithCopy for MessageFromSearchIndexer(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_1A8A61904(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t))sub_1A8A6127C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1A8A612D0);
}

__n128 __swift_memcpy25_8_4(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t *assignWithTake for MessageFromSearchIndexer(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1A8A6199C(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1A8A612D0);
}

uint64_t getEnumTagSinglePayload for MessageFromSearchIndexer(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x3D && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 61);
  }
  unsigned int v3 = (*(unsigned char *)(a1 + 24) & 0x3C | (*(unsigned __int8 *)(a1 + 24) >> 6)) ^ 0x3F;
  if (v3 >= 0x3C) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for MessageFromSearchIndexer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3C)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 61;
    if (a3 >= 0x3D) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0x3D) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = 0;
      *(unsigned char *)(result + 24) = 4 * (((-a2 >> 2) & 0xF) - 16 * a2);
    }
  }
  return result;
}

uint64_t sub_1A8A6142C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24) >> 6;
}

uint64_t sub_1A8A61438(uint64_t result)
{
  *(unsigned char *)(result + 24) &= 0x3Fu;
  return result;
}

uint64_t sub_1A8A61448(uint64_t result, char a2)
{
  *(unsigned char *)(result + 24) = *(unsigned char *)(result + 24) & 3 | (a2 << 6);
  return result;
}

ValueMetadata *type metadata accessor for MessageFromSearchIndexer()
{
  return &type metadata for MessageFromSearchIndexer;
}

uint64_t _s20IMAPSearchIndexerXPC15DownloadRequestOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1A8A61108(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

__n128 __swift_memcpy17_8_7(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for DownloadRequest.Response()
{
  return &type metadata for DownloadRequest.Response;
}

ValueMetadata *type metadata accessor for CredentialRequest()
{
  return &type metadata for CredentialRequest;
}

uint64_t getEnumTagSinglePayload for CredentialResponse(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CredentialResponse(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CredentialResponse()
{
  return &type metadata for CredentialResponse;
}

uint64_t destroy for SearchRequest(uint64_t a1, uint64_t a2)
{
  return sub_1A8A61670(a1, a2, (uint64_t (*)(void, void, void, void, void))sub_1A8A5C310);
}

uint64_t sub_1A8A61670(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, void, void, void, void))
{
  return a3(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned __int8 *)(a1 + 32));
}

uint64_t initializeWithCopy for SearchRequest(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_1A8A616A4(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))sub_1A8A5C1BC);
}

uint64_t sub_1A8A616A4(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = a2[2];
  uint64_t v8 = a2[3];
  uint64_t v9 = *((unsigned __int8 *)a2 + 32);
  a4(*a2, v6, v7, v8, v9);
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  *(unsigned char *)(a1 + 32) = v9;
  return a1;
}

uint64_t *assignWithCopy for SearchRequest(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_1A8A6173C(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))sub_1A8A5C1BC, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1A8A5C310);
}

uint64_t *sub_1A8A6173C(uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  uint64_t v9 = a2[2];
  uint64_t v10 = a2[3];
  uint64_t v11 = *((unsigned __int8 *)a2 + 32);
  a4(*a2, v8, v9, v10, v11);
  uint64_t v12 = *a1;
  uint64_t v13 = a1[1];
  uint64_t v14 = a1[2];
  uint64_t v15 = a1[3];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v9;
  a1[3] = v10;
  uint64_t v16 = *((unsigned __int8 *)a1 + 32);
  *((unsigned char *)a1 + 32) = v11;
  a5(v12, v13, v14, v15, v16);
  return a1;
}

uint64_t *assignWithTake for SearchRequest(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1A8A617E0(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1A8A5C310);
}

uint64_t *sub_1A8A617E0(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  char v6 = *(unsigned char *)(a2 + 32);
  uint64_t v7 = *a1;
  uint64_t v9 = a1[1];
  uint64_t v8 = a1[2];
  uint64_t v10 = a1[3];
  long long v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v11;
  uint64_t v12 = *((unsigned __int8 *)a1 + 32);
  *((unsigned char *)a1 + 32) = v6;
  a4(v7, v9, v8, v10, v12);
  return a1;
}

uint64_t destroy for SearchResponse(uint64_t a1)
{
  return sub_1A8A612F8(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
}

uint64_t initializeWithCopy for SearchResponse(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_1A8A61870(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t))sub_1A8A612A4);
}

uint64_t sub_1A8A61870(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = a2[2];
  uint64_t v8 = *((unsigned __int8 *)a2 + 24);
  a4(*a2, v6, v7, v8);
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  *(unsigned char *)(a1 + 24) = v8;
  return a1;
}

uint64_t *assignWithCopy for SearchResponse(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_1A8A61904(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t))sub_1A8A612A4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1A8A612F8);
}

uint64_t *sub_1A8A61904(uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  uint64_t v9 = a2[2];
  uint64_t v10 = *((unsigned __int8 *)a2 + 24);
  a4(*a2, v8, v9, v10);
  uint64_t v11 = *a1;
  uint64_t v12 = a1[1];
  uint64_t v13 = a1[2];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v9;
  uint64_t v14 = *((unsigned __int8 *)a1 + 24);
  *((unsigned char *)a1 + 24) = v10;
  a5(v11, v12, v13, v14);
  return a1;
}

uint64_t *assignWithTake for SearchResponse(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1A8A6199C(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1A8A612F8);
}

uint64_t *sub_1A8A6199C(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *(void *)(a2 + 16);
  char v7 = *(unsigned char *)(a2 + 24);
  uint64_t v8 = *a1;
  uint64_t v10 = a1[1];
  uint64_t v9 = a1[2];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = v6;
  uint64_t v11 = *((unsigned __int8 *)a1 + 24);
  *((unsigned char *)a1 + 24) = v7;
  a4(v8, v10, v9, v11);
  return a1;
}

ValueMetadata *type metadata accessor for SearchResponse()
{
  return &type metadata for SearchResponse;
}

ValueMetadata *type metadata accessor for SearchResponse.CodingKeys()
{
  return &type metadata for SearchResponse.CodingKeys;
}

ValueMetadata *type metadata accessor for SearchResponse.SearchResultsCodingKeys()
{
  return &type metadata for SearchResponse.SearchResultsCodingKeys;
}

ValueMetadata *type metadata accessor for SearchResponse.IndexingStatisticsCodingKeys()
{
  return &type metadata for SearchResponse.IndexingStatisticsCodingKeys;
}

ValueMetadata *type metadata accessor for SearchResponse.ExcludedUIDsCodingKeys()
{
  return &type metadata for SearchResponse.ExcludedUIDsCodingKeys;
}

ValueMetadata *type metadata accessor for SearchRequest.CodingKeys()
{
  return &type metadata for SearchRequest.CodingKeys;
}

ValueMetadata *type metadata accessor for SearchRequest.SearchCodingKeys()
{
  return &type metadata for SearchRequest.SearchCodingKeys;
}

ValueMetadata *type metadata accessor for SearchRequest.GetIndexingStatisticsCodingKeys()
{
  return &type metadata for SearchRequest.GetIndexingStatisticsCodingKeys;
}

ValueMetadata *type metadata accessor for SearchRequest.ExcludeIndexedUIDsCodingKeys()
{
  return &type metadata for SearchRequest.ExcludeIndexedUIDsCodingKeys;
}

ValueMetadata *type metadata accessor for CredentialResponse.CodingKeys()
{
  return &type metadata for CredentialResponse.CodingKeys;
}

ValueMetadata *type metadata accessor for CredentialResponse.CredentialsCodingKeys()
{
  return &type metadata for CredentialResponse.CredentialsCodingKeys;
}

ValueMetadata *type metadata accessor for CredentialRequest.CodingKeys()
{
  return &type metadata for CredentialRequest.CodingKeys;
}

ValueMetadata *type metadata accessor for CredentialRequest.MakeCredentialsCodingKeys()
{
  return &type metadata for CredentialRequest.MakeCredentialsCodingKeys;
}

ValueMetadata *type metadata accessor for DownloadRequest.CodingKeys()
{
  return &type metadata for DownloadRequest.CodingKeys;
}

unsigned char *_s20IMAPSearchIndexerXPC13SearchRequestO28ExcludeIndexedUIDsCodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1A8A61BACLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DownloadRequest.StartCodingKeys()
{
  return &type metadata for DownloadRequest.StartCodingKeys;
}

ValueMetadata *type metadata accessor for DownloadRequest.StopCodingKeys()
{
  return &type metadata for DownloadRequest.StopCodingKeys;
}

unsigned char *_s20IMAPSearchIndexerXPC15DownloadRequestO8ResponseOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *__n128 result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1A8A61CC0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DownloadRequest.Response.CodingKeys()
{
  return &type metadata for DownloadRequest.Response.CodingKeys;
}

ValueMetadata *type metadata accessor for DownloadRequest.Response.DidDeferCodingKeys()
{
  return &type metadata for DownloadRequest.Response.DidDeferCodingKeys;
}

ValueMetadata *type metadata accessor for DownloadRequest.Response.DidNotCompleteCodingKeys()
{
  return &type metadata for DownloadRequest.Response.DidNotCompleteCodingKeys;
}

ValueMetadata *type metadata accessor for DownloadRequest.Response.CurrentlyUnavailableCodingKeys()
{
  return &type metadata for DownloadRequest.Response.CurrentlyUnavailableCodingKeys;
}

ValueMetadata *type metadata accessor for DownloadRequest.Response.DidCompleteCodingKeys()
{
  return &type metadata for DownloadRequest.Response.DidCompleteCodingKeys;
}

ValueMetadata *type metadata accessor for DownloadRequest.Response.FailureCodingKeys()
{
  return &type metadata for DownloadRequest.Response.FailureCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for MessageFromSearchIndexer.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *__n128 result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1A8A61E14);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageFromSearchIndexer.CodingKeys()
{
  return &type metadata for MessageFromSearchIndexer.CodingKeys;
}

ValueMetadata *type metadata accessor for MessageFromSearchIndexer.DownloadCodingKeys()
{
  return &type metadata for MessageFromSearchIndexer.DownloadCodingKeys;
}

ValueMetadata *type metadata accessor for MessageFromSearchIndexer.SearchCodingKeys()
{
  return &type metadata for MessageFromSearchIndexer.SearchCodingKeys;
}

ValueMetadata *type metadata accessor for MessageFromSearchIndexer.CredentialsCodingKeys()
{
  return &type metadata for MessageFromSearchIndexer.CredentialsCodingKeys;
}

ValueMetadata *type metadata accessor for MessageFromSearchIndexer.IndexingStatisticsUpdateCodingKeys()
{
  return &type metadata for MessageFromSearchIndexer.IndexingStatisticsUpdateCodingKeys;
}

unsigned char *_s20IMAPSearchIndexerXPC14SearchResponseO10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *__n128 result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1A8A61F58);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageToSearchIndexer.CodingKeys()
{
  return &type metadata for MessageToSearchIndexer.CodingKeys;
}

ValueMetadata *type metadata accessor for MessageToSearchIndexer.DownloadCodingKeys()
{
  return &type metadata for MessageToSearchIndexer.DownloadCodingKeys;
}

ValueMetadata *type metadata accessor for MessageToSearchIndexer.SearchCodingKeys()
{
  return &type metadata for MessageToSearchIndexer.SearchCodingKeys;
}

unsigned char *_s20IMAPSearchIndexerXPC14SearchResponseO23SearchResultsCodingKeysOwst_0(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1A8A6204CLL);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageToSearchIndexer.CredentialsCodingKeys()
{
  return &type metadata for MessageToSearchIndexer.CredentialsCodingKeys;
}

unint64_t sub_1A8A62088()
{
  unint64_t result = qword_1E974F0F8;
  if (!qword_1E974F0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F0F8);
  }
  return result;
}

unint64_t sub_1A8A620E0()
{
  unint64_t result = qword_1E974F100;
  if (!qword_1E974F100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F100);
  }
  return result;
}

unint64_t sub_1A8A62138()
{
  unint64_t result = qword_1E974F108;
  if (!qword_1E974F108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F108);
  }
  return result;
}

unint64_t sub_1A8A62190()
{
  unint64_t result = qword_1E974F110;
  if (!qword_1E974F110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F110);
  }
  return result;
}

unint64_t sub_1A8A621E8()
{
  unint64_t result = qword_1E974F118;
  if (!qword_1E974F118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F118);
  }
  return result;
}

unint64_t sub_1A8A62240()
{
  unint64_t result = qword_1E974F120;
  if (!qword_1E974F120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F120);
  }
  return result;
}

unint64_t sub_1A8A62298()
{
  unint64_t result = qword_1E974F128;
  if (!qword_1E974F128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F128);
  }
  return result;
}

unint64_t sub_1A8A622F0()
{
  unint64_t result = qword_1E974F130;
  if (!qword_1E974F130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F130);
  }
  return result;
}

unint64_t sub_1A8A62348()
{
  unint64_t result = qword_1E974F138;
  if (!qword_1E974F138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F138);
  }
  return result;
}

unint64_t sub_1A8A623A0()
{
  unint64_t result = qword_1E974F140;
  if (!qword_1E974F140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F140);
  }
  return result;
}

unint64_t sub_1A8A623F8()
{
  unint64_t result = qword_1E974F148;
  if (!qword_1E974F148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F148);
  }
  return result;
}

unint64_t sub_1A8A62450()
{
  unint64_t result = qword_1E974F150;
  if (!qword_1E974F150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F150);
  }
  return result;
}

unint64_t sub_1A8A624A8()
{
  unint64_t result = qword_1E974F158;
  if (!qword_1E974F158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F158);
  }
  return result;
}

unint64_t sub_1A8A62500()
{
  unint64_t result = qword_1E974F160;
  if (!qword_1E974F160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F160);
  }
  return result;
}

unint64_t sub_1A8A62558()
{
  unint64_t result = qword_1E974F168;
  if (!qword_1E974F168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F168);
  }
  return result;
}

unint64_t sub_1A8A625B0()
{
  unint64_t result = qword_1E974F170;
  if (!qword_1E974F170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F170);
  }
  return result;
}

unint64_t sub_1A8A62608()
{
  unint64_t result = qword_1E974F178;
  if (!qword_1E974F178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F178);
  }
  return result;
}

unint64_t sub_1A8A62660()
{
  unint64_t result = qword_1E974F180;
  if (!qword_1E974F180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F180);
  }
  return result;
}

unint64_t sub_1A8A626B8()
{
  unint64_t result = qword_1E974F188;
  if (!qword_1E974F188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F188);
  }
  return result;
}

unint64_t sub_1A8A62710()
{
  unint64_t result = qword_1E974F190;
  if (!qword_1E974F190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F190);
  }
  return result;
}

unint64_t sub_1A8A62768()
{
  unint64_t result = qword_1E974F198;
  if (!qword_1E974F198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F198);
  }
  return result;
}

unint64_t sub_1A8A627C0()
{
  unint64_t result = qword_1E974F1A0;
  if (!qword_1E974F1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F1A0);
  }
  return result;
}

unint64_t sub_1A8A62818()
{
  unint64_t result = qword_1E974F1A8;
  if (!qword_1E974F1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F1A8);
  }
  return result;
}

unint64_t sub_1A8A62870()
{
  unint64_t result = qword_1E974F1B0;
  if (!qword_1E974F1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F1B0);
  }
  return result;
}

unint64_t sub_1A8A628C8()
{
  unint64_t result = qword_1E9746670;
  if (!qword_1E9746670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746670);
  }
  return result;
}

unint64_t sub_1A8A62920()
{
  unint64_t result = qword_1E9746668;
  if (!qword_1E9746668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746668);
  }
  return result;
}

unint64_t sub_1A8A62978()
{
  unint64_t result = qword_1E97466B0;
  if (!qword_1E97466B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97466B0);
  }
  return result;
}

unint64_t sub_1A8A629D0()
{
  unint64_t result = qword_1E97466A8;
  if (!qword_1E97466A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97466A8);
  }
  return result;
}

unint64_t sub_1A8A62A28()
{
  unint64_t result = qword_1E9746698;
  if (!qword_1E9746698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746698);
  }
  return result;
}

unint64_t sub_1A8A62A80()
{
  unint64_t result = qword_1E9746690;
  if (!qword_1E9746690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746690);
  }
  return result;
}

unint64_t sub_1A8A62AD8()
{
  unint64_t result = qword_1E9746688;
  if (!qword_1E9746688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746688);
  }
  return result;
}

unint64_t sub_1A8A62B30()
{
  unint64_t result = qword_1E9746680;
  if (!qword_1E9746680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746680);
  }
  return result;
}

unint64_t sub_1A8A62B88()
{
  unint64_t result = qword_1E9746618;
  if (!qword_1E9746618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746618);
  }
  return result;
}

unint64_t sub_1A8A62BE0()
{
  unint64_t result = qword_1E9746610;
  if (!qword_1E9746610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746610);
  }
  return result;
}

unint64_t sub_1A8A62C38()
{
  unint64_t result = qword_1E9746658;
  if (!qword_1E9746658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746658);
  }
  return result;
}

unint64_t sub_1A8A62C90()
{
  unint64_t result = qword_1E9746650;
  if (!qword_1E9746650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746650);
  }
  return result;
}

unint64_t sub_1A8A62CE8()
{
  unint64_t result = qword_1E9746640;
  if (!qword_1E9746640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746640);
  }
  return result;
}

unint64_t sub_1A8A62D40()
{
  unint64_t result = qword_1E9746638;
  if (!qword_1E9746638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746638);
  }
  return result;
}

unint64_t sub_1A8A62D98()
{
  unint64_t result = qword_1E9746630;
  if (!qword_1E9746630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746630);
  }
  return result;
}

unint64_t sub_1A8A62DF0()
{
  unint64_t result = qword_1E9746628;
  if (!qword_1E9746628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746628);
  }
  return result;
}

unint64_t sub_1A8A62E48()
{
  unint64_t result = qword_1E97467E8;
  if (!qword_1E97467E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97467E8);
  }
  return result;
}

unint64_t sub_1A8A62EA0()
{
  unint64_t result = qword_1E97467E0;
  if (!qword_1E97467E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97467E0);
  }
  return result;
}

unint64_t sub_1A8A62EF8()
{
  unint64_t result = qword_1E97467D0;
  if (!qword_1E97467D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97467D0);
  }
  return result;
}

unint64_t sub_1A8A62F50()
{
  unint64_t result = qword_1E97467C8;
  if (!qword_1E97467C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97467C8);
  }
  return result;
}

unint64_t sub_1A8A62FA8()
{
  unint64_t result = qword_1E97467B0;
  if (!qword_1E97467B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97467B0);
  }
  return result;
}

unint64_t sub_1A8A63000()
{
  unint64_t result = qword_1E97467A8;
  if (!qword_1E97467A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97467A8);
  }
  return result;
}

unint64_t sub_1A8A63058()
{
  unint64_t result = qword_1E9746798;
  if (!qword_1E9746798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746798);
  }
  return result;
}

unint64_t sub_1A8A630B0()
{
  unint64_t result = qword_1E9746790;
  if (!qword_1E9746790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746790);
  }
  return result;
}

unint64_t sub_1A8A63108()
{
  unint64_t result = qword_1E97466F8;
  if (!qword_1E97466F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97466F8);
  }
  return result;
}

unint64_t sub_1A8A63160()
{
  unint64_t result = qword_1E97466F0;
  if (!qword_1E97466F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97466F0);
  }
  return result;
}

unint64_t sub_1A8A631B8()
{
  unint64_t result = qword_1E97466E0;
  if (!qword_1E97466E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97466E0);
  }
  return result;
}

unint64_t sub_1A8A63210()
{
  unint64_t result = qword_1E97466D8;
  if (!qword_1E97466D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97466D8);
  }
  return result;
}

unint64_t sub_1A8A63268()
{
  unint64_t result = qword_1E97466C8;
  if (!qword_1E97466C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97466C8);
  }
  return result;
}

unint64_t sub_1A8A632C0()
{
  unint64_t result = qword_1E97466C0;
  if (!qword_1E97466C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97466C0);
  }
  return result;
}

unint64_t sub_1A8A63318()
{
  unint64_t result = qword_1E9746740;
  if (!qword_1E9746740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746740);
  }
  return result;
}

unint64_t sub_1A8A63370()
{
  unint64_t result = qword_1E9746738;
  if (!qword_1E9746738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746738);
  }
  return result;
}

unint64_t sub_1A8A633C8()
{
  unint64_t result = qword_1E9746760;
  if (!qword_1E9746760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746760);
  }
  return result;
}

unint64_t sub_1A8A63420()
{
  unint64_t result = qword_1E9746758;
  if (!qword_1E9746758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746758);
  }
  return result;
}

unint64_t sub_1A8A63478()
{
  unint64_t result = qword_1E9746770;
  if (!qword_1E9746770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746770);
  }
  return result;
}

unint64_t sub_1A8A634D0()
{
  unint64_t result = qword_1E9746768;
  if (!qword_1E9746768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746768);
  }
  return result;
}

unint64_t sub_1A8A63528()
{
  unint64_t result = qword_1E9746750;
  if (!qword_1E9746750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746750);
  }
  return result;
}

unint64_t sub_1A8A63580()
{
  unint64_t result = qword_1E9746748;
  if (!qword_1E9746748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746748);
  }
  return result;
}

unint64_t sub_1A8A635D8()
{
  unint64_t result = qword_1E9746728;
  if (!qword_1E9746728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746728);
  }
  return result;
}

unint64_t sub_1A8A63630()
{
  unint64_t result = qword_1E9746720;
  if (!qword_1E9746720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746720);
  }
  return result;
}

unint64_t sub_1A8A63688()
{
  unint64_t result = qword_1E9746718;
  if (!qword_1E9746718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746718);
  }
  return result;
}

unint64_t sub_1A8A636E0()
{
  unint64_t result = qword_1E9746710;
  if (!qword_1E9746710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746710);
  }
  return result;
}

unint64_t sub_1A8A63738()
{
  unint64_t result = qword_1E9746520;
  if (!qword_1E9746520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746520);
  }
  return result;
}

unint64_t sub_1A8A63790()
{
  unint64_t result = qword_1E9746518;
  if (!qword_1E9746518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746518);
  }
  return result;
}

unint64_t sub_1A8A637E8()
{
  unint64_t result = qword_1E97464F0;
  if (!qword_1E97464F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97464F0);
  }
  return result;
}

unint64_t sub_1A8A63840()
{
  unint64_t result = qword_1E97464E8;
  if (!qword_1E97464E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97464E8);
  }
  return result;
}

unint64_t sub_1A8A63898()
{
  unint64_t result = qword_1E9746538;
  if (!qword_1E9746538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746538);
  }
  return result;
}

unint64_t sub_1A8A638F0()
{
  unint64_t result = qword_1E9746530;
  if (!qword_1E9746530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746530);
  }
  return result;
}

unint64_t sub_1A8A63948()
{
  unint64_t result = qword_1E9746550;
  if (!qword_1E9746550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746550);
  }
  return result;
}

unint64_t sub_1A8A639A0()
{
  unint64_t result = qword_1E9746548;
  if (!qword_1E9746548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746548);
  }
  return result;
}

unint64_t sub_1A8A639F8()
{
  unint64_t result = qword_1E9746508;
  if (!qword_1E9746508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746508);
  }
  return result;
}

unint64_t sub_1A8A63A50()
{
  unint64_t result = qword_1E9746500;
  if (!qword_1E9746500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746500);
  }
  return result;
}

unint64_t sub_1A8A63AA8()
{
  unint64_t result = qword_1E97464B8;
  if (!qword_1E97464B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97464B8);
  }
  return result;
}

unint64_t sub_1A8A63B00()
{
  unint64_t result = qword_1E97464B0;
  if (!qword_1E97464B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97464B0);
  }
  return result;
}

unint64_t sub_1A8A63B58()
{
  unint64_t result = qword_1E9746488;
  if (!qword_1E9746488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746488);
  }
  return result;
}

unint64_t sub_1A8A63BB0()
{
  unint64_t result = qword_1E9746480;
  if (!qword_1E9746480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746480);
  }
  return result;
}

unint64_t sub_1A8A63C08()
{
  unint64_t result = qword_1E97464D0;
  if (!qword_1E97464D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97464D0);
  }
  return result;
}

unint64_t sub_1A8A63C60()
{
  unint64_t result = qword_1E97464C8;
  if (!qword_1E97464C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97464C8);
  }
  return result;
}

unint64_t sub_1A8A63CB8()
{
  unint64_t result = qword_1E97464A0;
  if (!qword_1E97464A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97464A0);
  }
  return result;
}

unint64_t sub_1A8A63D10()
{
  unint64_t result = qword_1E9746498;
  if (!qword_1E9746498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746498);
  }
  return result;
}

unint64_t sub_1A8A63D64()
{
  unint64_t result = qword_1E9746910;
  if (!qword_1E9746910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746910);
  }
  return result;
}

unint64_t sub_1A8A63DB8()
{
  unint64_t result = qword_1E97432A8;
  if (!qword_1E97432A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97432A8);
  }
  return result;
}

unint64_t sub_1A8A63E0C()
{
  unint64_t result = qword_1E9746CC0;
  if (!qword_1E9746CC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract_0(&qword_1E9746CB0);
    sub_1A8A63EC0();
    sub_1A8A64010(&qword_1E9746E68, &qword_1E9746E60, (void (*)(void))sub_1A8A63D64);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746CC0);
  }
  return result;
}

unint64_t sub_1A8A63EC0()
{
  unint64_t result = qword_1E9746968;
  if (!qword_1E9746968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746968);
  }
  return result;
}

unint64_t sub_1A8A63F14()
{
  unint64_t result = qword_1E974F1D8;
  if (!qword_1E974F1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F1D8);
  }
  return result;
}

unint64_t sub_1A8A63F68()
{
  unint64_t result = qword_1E974F1F8;
  if (!qword_1E974F1F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F1F8);
  }
  return result;
}

unint64_t sub_1A8A63FBC()
{
  unint64_t result = qword_1E974F218;
  if (!qword_1E974F218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F218);
  }
  return result;
}

uint64_t sub_1A8A64010(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract_0(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1A8A6407C()
{
  unint64_t result = qword_1E974F228;
  if (!qword_1E974F228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F228);
  }
  return result;
}

uint64_t sub_1A8A640D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F230);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1A8A64138()
{
  unint64_t result = qword_1E97467B8;
  if (!qword_1E97467B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97467B8);
  }
  return result;
}

unint64_t sub_1A8A6418C()
{
  unint64_t result = qword_1E97432A0;
  if (!qword_1E97432A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97432A0);
  }
  return result;
}

unint64_t sub_1A8A641E0()
{
  unint64_t result = qword_1E9746778;
  if (!qword_1E9746778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746778);
  }
  return result;
}

unint64_t sub_1A8A64234()
{
  unint64_t result = qword_1E974F258;
  if (!qword_1E974F258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F258);
  }
  return result;
}

unint64_t sub_1A8A64288()
{
  unint64_t result = qword_1E974F260;
  if (!qword_1E974F260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F260);
  }
  return result;
}

unint64_t sub_1A8A642DC()
{
  unint64_t result = qword_1E974F268;
  if (!qword_1E974F268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F268);
  }
  return result;
}

void *sub_1A8A64330(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_1A8A64384(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  switch((a10 >> 59) & 6 | ((a8 & 0x2000000000000000) != 0))
  {
    case 0uLL:
      sub_1A85135AC(result, a2);
      unint64_t result = a3;
      a2 = a4;
      goto LABEL_4;
    case 1uLL:
      unint64_t v15 = a8 & 0xDFFFFFFFFFFFFFFFLL;
      sub_1A85135AC(result, a2);
      sub_1A85135AC(a3, a4);
      sub_1A85135AC(a5, a6);
      sub_1A85135AC(a7, v15);
      unint64_t result = a9;
      a2 = a10 & 0xCFFFFFFFFFFFFFFFLL;
      goto LABEL_4;
    case 2uLL:
LABEL_4:
      unint64_t result = sub_1A85135AC(result, a2);
      break;
    case 3uLL:
      swift_bridgeObjectRelease();
      unint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

id *sub_1A8A644C0(id *a1)
{
  id v2 = *a1;
  return a1;
}

id *sub_1A8A644EC(id *a1)
{
  return a1;
}

uint64_t sub_1A8A64518(uint64_t a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

void *SearchIndexerXPC.serviceName.unsafeMutableAddressor()
{
  return &static SearchIndexerXPC.serviceName;
}

unint64_t static SearchIndexerXPC.serviceName.getter()
{
  return 0xD00000000000001DLL;
}

ValueMetadata *type metadata accessor for SearchIndexerXPC()
{
  return &type metadata for SearchIndexerXPC;
}

uint64_t sub_1A8A6459C()
{
  uint64_t v0 = sub_1A8A754D8();
  __swift_allocate_value_buffer_0(v0, qword_1E97432B0);
  __swift_project_value_buffer_0(v0, (uint64_t)qword_1E97432B0);
  return sub_1A8A754C8();
}

uint64_t SearchSession.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  SearchSession.init()();
  return v0;
}

uint64_t SearchSession.init()()
{
  uint64_t v2 = sub_1A8A75518();
  MEMORY[0x1F4188790](v2);
  sub_1A8A75588();
  __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E97475A8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1A8AD8F00;
  sub_1A8A75508();
  sub_1A8A64848();
  __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9746E88);
  sub_1A8A648A0();
  sub_1A8A77BF8();
  uint64_t v3 = sub_1A8A754F8();
  if (v1) {
    swift_deallocPartialClassInstance();
  }
  else {
    *(void *)(v0 + 16) = v3;
  }
  return v0;
}

unint64_t sub_1A8A64848()
{
  unint64_t result = qword_1E9746A00;
  if (!qword_1E9746A00)
  {
    sub_1A8A75518();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746A00);
  }
  return result;
}

unint64_t sub_1A8A648A0()
{
  unint64_t result = qword_1E9746E90;
  if (!qword_1E9746E90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract_0(&qword_1E9746E88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746E90);
  }
  return result;
}

uint64_t SearchSession.deinit()
{
  sub_1A8A75568();
  swift_release();
  return v0;
}

uint64_t SearchSession.__deallocating_deinit()
{
  sub_1A8A75568();
  swift_release();
  return swift_deallocClassInstance();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SearchSession.activate()()
{
}

Swift::Void __swiftcall SearchSession.cancel(reason:)(Swift::String reason)
{
  if (qword_1E97432C8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1A8A754D8();
  __swift_project_value_buffer_0(v1, (uint64_t)qword_1E97432B0);
  uint64_t v2 = sub_1A8A754B8();
  os_log_type_t v3 = sub_1A8A77468();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A7EFF000, v2, v3, "cancel", v4, 2u);
    MEMORY[0x1AD0E4D00](v4, -1, -1);
  }

  sub_1A8A75568();
}

uint64_t SearchSession.perform(query:_:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_1E97432C8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1A8A754D8();
  __swift_project_value_buffer_0(v10, (uint64_t)qword_1E97432B0);
  id v11 = a1;
  swift_bridgeObjectRetain_n();
  id v12 = v11;
  uint64_t v13 = sub_1A8A754B8();
  os_log_type_t v14 = sub_1A8A77468();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v24 = a2;
    unint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v25[0] = v16;
    *(_DWORD *)unint64_t v15 = 136315138;
    uint64_t v17 = SearchQuery.debugDescription.getter();
    sub_1A8A667F8(v17, v18, v25);
    sub_1A8A77958();
    swift_bridgeObjectRelease_n();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A7EFF000, v13, v14, "Sending search %s to SearchIndexer.", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E4D00](v16, -1, -1);
    uint64_t v19 = v15;
    a2 = v24;
    MEMORY[0x1AD0E4D00](v19, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = v12;
  v20[3] = a2;
  v20[4] = a3;
  v20[5] = a4;
  v20[6] = a5;
  v25[0] = (uint64_t)v12;
  v25[1] = a2;
  _DWORD v25[2] = a3;
  v25[3] = 0;
  char v26 = 64;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = sub_1A8A667BC;
  *(void *)(v21 + 24) = v20;
  sub_1A8A5DAD8();
  sub_1A8A5DB2C();
  id v22 = v12;
  _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
  swift_retain();
  swift_retain();
  sub_1A8A75548();
  swift_release();
  return swift_release();
}

void sub_1A8A64F08(char *a1, uint64_t a2, uint64_t a3, __int16 a4, char *a5, int a6, int a7, void (*a8)(void), uint64_t a9)
{
  LOBYTE(v10) = a4;
  if ((a4 & 0x100) != 0)
  {
    uint64_t v34 = a1;
    if (qword_1E97432C8 == -1)
    {
LABEL_32:
      uint64_t v35 = sub_1A8A754D8();
      __swift_project_value_buffer_0(v35, (uint64_t)qword_1E97432B0);
      sub_1A8A67150(a1, a2, a3, v10, 1);
      uint64_t v36 = a5;
      _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
      sub_1A8A67150(a1, a2, a3, v10, 1);
      uint64_t v37 = v36;
      _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
      uint64_t v38 = sub_1A8A754B8();
      os_log_type_t v39 = sub_1A8A77448();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v40 = swift_slowAlloc();
        uint64_t v52 = (void *)swift_slowAlloc();
        uint64_t v54 = swift_slowAlloc();
        uint64_t v57 = v54;
        *(_DWORD *)uint64_t v40 = 136315394;
        uint64_t v41 = SearchQuery.debugDescription.getter();
        sub_1A8A667F8(v41, v42, &v57);
        sub_1A8A77958();
        swift_bridgeObjectRelease_n();

        swift_bridgeObjectRelease();
        *(_WORD *)(v40 + 12) = 2112;
        uint64_t v56 = sub_1A8A747C8();
        sub_1A8A77958();
        *uint64_t v52 = v56;
        sub_1A8A66F18(a1, a2, a3, v10, 1);
        sub_1A8A66F18(a1, a2, a3, v10, 1);
        _os_log_impl(&dword_1A7EFF000, v38, v39, "Search %s failed: %@", (uint8_t *)v40, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9748748);
        swift_arrayDestroy();
        MEMORY[0x1AD0E4D00](v52, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x1AD0E4D00](v54, -1, -1);
        MEMORY[0x1AD0E4D00](v40, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();

        sub_1A8A66F18(a1, a2, a3, v10, 1);
        sub_1A8A66F18(a1, a2, a3, v10, 1);
      }

      sub_1A8A657B4(MEMORY[0x1E4FBC860]);
      a8();
      swift_bridgeObjectRelease();
      sub_1A8A66F18(a1, a2, a3, v10, 1);
      return;
    }
LABEL_47:
    swift_once();
    goto LABEL_32;
  }
  if (a4 == 64)
  {
    if (qword_1E97432C8 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1A8A754D8();
    __swift_project_value_buffer_0(v14, (uint64_t)qword_1E97432B0);
    unint64_t v15 = a5;
    _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
    sub_1A8A67150(a1, a2, a3, 0x40u, 0);
    uint64_t v16 = v15;
    _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
    sub_1A8A67150(a1, a2, a3, 0x40u, 0);
    uint64_t v17 = sub_1A8A754B8();
    os_log_type_t v18 = sub_1A8A77468();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v53 = swift_slowAlloc();
      uint64_t v57 = v53;
      *(_DWORD *)uint64_t v10 = 136315394;
      uint64_t v19 = SearchQuery.debugDescription.getter();
      sub_1A8A667F8(v19, v20, &v57);
      sub_1A8A77958();
      swift_bridgeObjectRelease_n();

      swift_bridgeObjectRelease();
      int64_t v21 = 0;
      a5 = 0;
      *(_WORD *)(v10 + 12) = 2048;
      id v22 = a1 + 64;
      uint64_t v23 = 1 << a1[32];
      if (v23 < 64) {
        uint64_t v24 = ~(-1 << v23);
      }
      else {
        uint64_t v24 = -1;
      }
      unint64_t v25 = v24 & *((void *)a1 + 8);
      int64_t v26 = (unint64_t)(v23 + 63) >> 6;
      do
      {
        if (v25)
        {
          unint64_t v27 = __clz(__rbit64(v25));
          v25 &= v25 - 1;
          unint64_t v28 = v27 | (v21 << 6);
        }
        else
        {
          int64_t v31 = v21 + 1;
          if (__OFADD__(v21, 1)) {
            goto LABEL_46;
          }
          if (v31 >= v26)
          {
LABEL_43:
            swift_release();
            sub_1A8A77958();
            sub_1A8A66F18(a1, a2, a3, 0x40u, 0);
            _os_log_impl(&dword_1A7EFF000, v17, v18, "Received response for search %s with %ld) results.", (uint8_t *)v10, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x1AD0E4D00](v53, -1, -1);
            MEMORY[0x1AD0E4D00](v10, -1, -1);
            goto LABEL_44;
          }
          unint64_t v32 = *(void *)&v22[8 * v31];
          ++v21;
          if (!v32)
          {
            int64_t v21 = v31 + 1;
            if (v31 + 1 >= v26) {
              goto LABEL_43;
            }
            unint64_t v32 = *(void *)&v22[8 * v21];
            if (!v32)
            {
              int64_t v21 = v31 + 2;
              if (v31 + 2 >= v26) {
                goto LABEL_43;
              }
              unint64_t v32 = *(void *)&v22[8 * v21];
              if (!v32)
              {
                int64_t v21 = v31 + 3;
                if (v31 + 3 >= v26) {
                  goto LABEL_43;
                }
                unint64_t v32 = *(void *)&v22[8 * v21];
                if (!v32)
                {
                  int64_t v21 = v31 + 4;
                  if (v31 + 4 >= v26) {
                    goto LABEL_43;
                  }
                  unint64_t v32 = *(void *)&v22[8 * v21];
                  if (!v32)
                  {
                    int64_t v33 = v31 + 5;
                    if (v33 >= v26) {
                      goto LABEL_43;
                    }
                    unint64_t v32 = *(void *)&v22[8 * v33];
                    if (!v32)
                    {
                      while (1)
                      {
                        int64_t v21 = v33 + 1;
                        if (__OFADD__(v33, 1)) {
                          break;
                        }
                        if (v21 >= v26) {
                          goto LABEL_43;
                        }
                        unint64_t v32 = *(void *)&v22[8 * v21];
                        ++v33;
                        if (v32) {
                          goto LABEL_30;
                        }
                      }
                      __break(1u);
                      return;
                    }
                    int64_t v21 = v33;
                  }
                }
              }
            }
          }
LABEL_30:
          unint64_t v25 = (v32 - 1) & v32;
          unint64_t v28 = __clz(__rbit64(v32)) + (v21 << 6);
        }
        uint64_t v29 = *(void *)(*(void *)(*((void *)a1 + 7) + 8 * v28) + 16);
        BOOL v30 = __OFADD__(a5, v29);
        a5 += v29;
      }
      while (!v30);
      __break(1u);
LABEL_46:
      __break(1u);
      goto LABEL_47;
    }
    sub_1A8A66F18(a1, a2, a3, 0x40u, 0);
    swift_bridgeObjectRelease_n();

    sub_1A8A66F18(a1, a2, a3, 0x40u, 0);
LABEL_44:

    ((void (*)(char *))a8)(a1);
  }
  else
  {
    if (qword_1E97432C8 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_1A8A754D8();
    __swift_project_value_buffer_0(v43, (uint64_t)qword_1E97432B0);
    char v44 = a5;
    swift_bridgeObjectRetain_n();
    uint64_t v45 = v44;
    uint64_t v46 = sub_1A8A754B8();
    os_log_type_t v47 = sub_1A8A77448();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      uint64_t v57 = v49;
      *(_DWORD *)uint64_t v48 = 136315138;
      uint64_t v50 = SearchQuery.debugDescription.getter();
      sub_1A8A667F8(v50, v51, &v57);
      sub_1A8A77958();
      swift_bridgeObjectRelease_n();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A7EFF000, v46, v47, "Invalid response for %s", v48, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0E4D00](v49, -1, -1);
      MEMORY[0x1AD0E4D00](v48, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_1A8A657B4(MEMORY[0x1E4FBC860]);
    a8();
    swift_bridgeObjectRelease();
  }
}

unint64_t sub_1A8A657B4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F270);
  uint64_t v2 = (void *)sub_1A8A781E8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    unsigned int v6 = (unsigned __int8 *)*(v4 - 2);
    uint64_t v8 = (unsigned __int8 *)*(v4 - 1);
    uint64_t v7 = *v4;
    _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
    _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
    _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
    unint64_t result = sub_1A8A66F24(v5, v6, v8);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v11 = (uint64_t *)(v2[6] + 24 * result);
    *id v11 = v5;
    v11[1] = (uint64_t)v6;
    void v11[2] = (uint64_t)v8;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 4;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t SearchSession.getIndexingStatistics(_:)(uint64_t a1, uint64_t a2)
{
  if (qword_1E97432C8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1A8A754D8();
  __swift_project_value_buffer_0(v4, (uint64_t)qword_1E97432B0);
  uint64_t v5 = sub_1A8A754B8();
  os_log_type_t v6 = sub_1A8A77468();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1A7EFF000, v5, v6, "Sending request for indexing statistics to SearchIndexer.", v7, 2u);
    MEMORY[0x1AD0E4D00](v7, -1, -1);
  }

  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_1A8A66E50;
  *(void *)(v9 + 24) = v8;
  sub_1A8A5DAD8();
  sub_1A8A5DB2C();
  swift_retain();
  swift_retain();
  sub_1A8A75548();
  swift_release();
  return swift_release();
}

void sub_1A8A65C10(id a1, uint64_t a2, uint64_t a3, __int16 a4, void (*a5)(void, void, void))
{
  unsigned __int8 v6 = a4;
  if ((a4 & 0x100) != 0)
  {
    id v17 = a1;
    if (qword_1E97432C8 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1A8A754D8();
    __swift_project_value_buffer_0(v18, (uint64_t)qword_1E97432B0);
    id v19 = a1;
    id v20 = a1;
    int64_t v21 = sub_1A8A754B8();
    os_log_type_t v22 = sub_1A8A77448();
    if (os_log_type_enabled(v21, v22))
    {
      int64_t v31 = a5;
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      BOOL v30 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 138412290;
      id v24 = a1;
      uint64_t v32 = _swift_stdlib_bridgeErrorToNSError();
      sub_1A8A77958();
      *BOOL v30 = v32;
      sub_1A8A66F18(a1, a2, a3, v6, 1);
      sub_1A8A66F18(a1, a2, a3, v6, 1);
      _os_log_impl(&dword_1A7EFF000, v21, v22, "Requesting statistics failed with error %@", v23, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9748748);
      swift_arrayDestroy();
      MEMORY[0x1AD0E4D00](v30, -1, -1);
      unint64_t v25 = v23;
      a5 = v31;
      MEMORY[0x1AD0E4D00](v25, -1, -1);
    }
    else
    {
      sub_1A8A66F18(a1, a2, a3, v6, 1);
      sub_1A8A66F18(a1, a2, a3, v6, 1);
    }

    a5(0, 0, 0);
    sub_1A8A66F18(a1, a2, a3, v6, 1);
  }
  else
  {
    if (a4 == 65)
    {
      if (qword_1E97432C8 != -1) {
        swift_once();
      }
      uint64_t v10 = sub_1A8A754D8();
      __swift_project_value_buffer_0(v10, (uint64_t)qword_1E97432B0);
      id v11 = sub_1A8A754B8();
      os_log_type_t v12 = sub_1A8A77468();
      if (os_log_type_enabled(v11, v12))
      {
        BOOL v13 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)BOOL v13 = 0;
        _os_log_impl(&dword_1A7EFF000, v11, v12, "Received a response when requesting statistics", v13, 2u);
        MEMORY[0x1AD0E4D00](v13, -1, -1);
      }

      id v14 = a1;
      uint64_t v15 = a2;
      uint64_t v16 = a3;
    }
    else
    {
      if (qword_1E97432C8 != -1) {
        swift_once();
      }
      uint64_t v26 = sub_1A8A754D8();
      __swift_project_value_buffer_0(v26, (uint64_t)qword_1E97432B0);
      unint64_t v27 = sub_1A8A754B8();
      os_log_type_t v28 = sub_1A8A77448();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v29 = 0;
        _os_log_impl(&dword_1A7EFF000, v27, v28, "Invalid response when requesting statistics", v29, 2u);
        MEMORY[0x1AD0E4D00](v29, -1, -1);
      }

      id v14 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
    }
    a5(v14, v15, v16);
  }
}

uint64_t SearchSession.excludeIndexedUIDs(in:from:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (qword_1E97432C8 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1A8A754D8();
  __swift_project_value_buffer_0(v9, (uint64_t)qword_1E97432B0);
  uint64_t v10 = sub_1A8A754B8();
  os_log_type_t v11 = sub_1A8A77468();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = a4;
    uint64_t v13 = a6;
    uint64_t v14 = a5;
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_1A7EFF000, v10, v11, "Sending request to exclude indexed UIDs to SearchIndexer.", v15, 2u);
    uint64_t v16 = v15;
    a5 = v14;
    a6 = v13;
    a4 = v12;
    MEMORY[0x1AD0E4D00](v16, -1, -1);
  }

  id v17 = (void *)swift_allocObject();
  long long v17[2] = a5;
  v17[3] = a6;
  v17[4] = a4;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = sub_1A8A66EA4;
  *(void *)(v18 + 24) = v17;
  sub_1A8A5DAD8();
  sub_1A8A5DB2C();
  swift_retain();
  _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
  swift_retain();
  sub_1A8A75548();
  swift_release();
  return swift_release();
}

void sub_1A8A66380(id a1, uint64_t a2, uint64_t a3, __int16 a4, void (*a5)(void), uint64_t a6, void *a7)
{
  unsigned __int8 v9 = a4;
  if ((a4 & 0x100) != 0)
  {
    id v18 = a1;
    if (qword_1E97432C8 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_1A8A754D8();
    __swift_project_value_buffer_0(v19, (uint64_t)qword_1E97432B0);
    id v20 = a1;
    id v21 = a1;
    os_log_type_t v22 = sub_1A8A754B8();
    os_log_type_t v23 = sub_1A8A77448();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v32 = a5;
      id v24 = (uint8_t *)swift_slowAlloc();
      int64_t v31 = (void *)swift_slowAlloc();
      *(_DWORD *)id v24 = 138412290;
      id v25 = a1;
      uint64_t v33 = _swift_stdlib_bridgeErrorToNSError();
      sub_1A8A77958();
      *int64_t v31 = v33;
      sub_1A8A66F18(a1, a2, a3, v9, 1);
      sub_1A8A66F18(a1, a2, a3, v9, 1);
      _os_log_impl(&dword_1A7EFF000, v22, v23, "Request to exclude indexed UIDs failed with error %@", v24, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9748748);
      swift_arrayDestroy();
      MEMORY[0x1AD0E4D00](v31, -1, -1);
      uint64_t v26 = v24;
      a5 = v32;
      MEMORY[0x1AD0E4D00](v26, -1, -1);
    }
    else
    {
      sub_1A8A66F18(a1, a2, a3, v9, 1);
      sub_1A8A66F18(a1, a2, a3, v9, 1);
    }

    a5(a7);
    sub_1A8A66F18(a1, a2, a3, v9, 1);
  }
  else
  {
    if (a4 == 66)
    {
      if (qword_1E97432C8 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_1A8A754D8();
      __swift_project_value_buffer_0(v11, (uint64_t)qword_1E97432B0);
      uint64_t v12 = sub_1A8A754B8();
      os_log_type_t v13 = sub_1A8A77468();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_1A7EFF000, v12, v13, "Received a response when requesting to exclude indexed UIDs", v14, 2u);
        MEMORY[0x1AD0E4D00](v14, -1, -1);
      }

      id v15 = a1;
    }
    else
    {
      if (qword_1E97432C8 != -1) {
        swift_once();
      }
      uint64_t v27 = sub_1A8A754D8();
      __swift_project_value_buffer_0(v27, (uint64_t)qword_1E97432B0);
      os_log_type_t v28 = sub_1A8A754B8();
      os_log_type_t v29 = sub_1A8A77448();
      if (os_log_type_enabled(v28, v29))
      {
        BOOL v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)BOOL v30 = 0;
        _os_log_impl(&dword_1A7EFF000, v28, v29, "Invalid response when requesting to exclude indexed UIDs", v30, 2u);
        MEMORY[0x1AD0E4D00](v30, -1, -1);
      }

      id v15 = a7;
    }
    a5(v15);
  }
}

uint64_t sub_1A8A66774()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_1A8A667BC(char *a1, uint64_t a2, uint64_t a3, __int16 a4)
{
  sub_1A8A64F08(a1, a2, a3, a4 & 0x1FF, *(char **)(v4 + 16), *(void *)(v4 + 24), *(void *)(v4 + 32), *(void (**)(void))(v4 + 40), *(void *)(v4 + 48));
}

uint64_t sub_1A8A667F0(uint64_t a1)
{
  return sub_1A8A589C0(a1, *(uint64_t (**)(void, void, void, void))(v1 + 16));
}

uint64_t sub_1A8A667F8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1A8A668CC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1A85E05A0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1A85E05A0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_1A8A668CC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1A8A779C8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1A8A66A88(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_1A8A77E88();
  if (!v8)
  {
    sub_1A8A780E8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1A8A781F8();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1A8A66A88(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1A8A66B20(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1A8A66D00(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1A8A66D00(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1A8A66B20(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_1A8A66C98(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1A8A77DD8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1A8A780E8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1A8A76848();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1A8A781F8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1A8A780E8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1A8A66C98(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9745EE0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size_0(v4);
  long long v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1A8A66D00(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9745EE0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size_0(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  os_log_type_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1A8A781F8();
  __break(1u);
  return result;
}

void sub_1A8A66E50(void *a1, uint64_t a2, uint64_t a3, __int16 a4)
{
  sub_1A8A65C10(a1, a2, a3, a4 & 0x1FF, *(void (**)(void, void, void))(v4 + 16));
}

uint64_t sub_1A8A66E64()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1A8A66EA4(void *a1, uint64_t a2, uint64_t a3, __int16 a4)
{
  sub_1A8A66380(a1, a2, a3, a4 & 0x1FF, *(void (**)(void))(v4 + 16), *(void *)(v4 + 24), *(void **)(v4 + 32));
}

uint64_t sub_1A8A66EBC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t type metadata accessor for SearchSession()
{
  return self;
}

void sub_1A8A66F18(id a1, uint64_t a2, uint64_t a3, unsigned __int8 a4, char a5)
{
  if (a5) {

  }
  else {
    sub_1A8A612D0((uint64_t)a1, a2, a3, a4);
  }
}

unint64_t sub_1A8A66F24(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  sub_1A8A78738();
  uint64_t v6 = *(void *)(a1 + 16);
  sub_1A8A78768();
  if (v6)
  {
    uint64_t v7 = a1 + 32;
    do
    {
      ++v7;
      sub_1A8A78778();
      --v6;
    }
    while (v6);
  }
  _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
  sub_1A8A762A8();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_1A8A787C8();
  return sub_1A8A66FF0(a1, a2, a3, v8);
}

unint64_t sub_1A8A66FF0(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4)
{
  uint64_t v5 = v4 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = a4 & ~v6;
  if ((*(void *)(v4 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    uint64_t v11 = ~v6;
    uint64_t v12 = *(void *)(a1 + 16);
    uint64_t v13 = *(void *)(v4 + 48);
    id v25 = (unsigned __int8 *)(a1 + 34);
    do
    {
      uint64_t v14 = (unsigned __int8 **)(v13 + 24 * v7);
      id v15 = *v14;
      if (*((void *)*v14 + 2) == v12)
      {
        uint64_t v16 = v14[1];
        id v17 = v14[2];
        if (v12 && v15 != (unsigned __int8 *)a1)
        {
          if (v15[32] != *(unsigned __int8 *)(a1 + 32)) {
            goto LABEL_4;
          }
          if (v12 != 1)
          {
            if (v15[33] != *(unsigned __int8 *)(a1 + 33)) {
              goto LABEL_4;
            }
            id v18 = v15 + 34;
            uint64_t v19 = v12 - 2;
            id v20 = v25;
            while (v19)
            {
              int v22 = *v18++;
              int v21 = v22;
              int v23 = *v20++;
              --v19;
              if (v21 != v23) {
                goto LABEL_4;
              }
            }
          }
        }
        if (v16 == a2 && v17 == a3 || (sub_1A8A78588() & 1) != 0) {
          return v7;
        }
      }
LABEL_4:
      unint64_t v7 = (v7 + 1) & v11;
    }
    while (((*(void *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

id sub_1A8A67150(id a1, uint64_t a2, uint64_t a3, unsigned __int8 a4, char a5)
{
  if (a5) {
    return a1;
  }
  else {
    return (id)sub_1A8A6127C((uint64_t)a1, a2, a3, a4);
  }
}

uint64_t sub_1A8A67178(void **a1, void **a2)
{
  return _s20IMAPSearchIndexerXPC10SuggestionV2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t Suggestion.init(from:)(void *a1)
{
  return sub_1A8A678F0(a1);
}

uint64_t Suggestion.encode(to:)(void *a1, uint64_t a2)
{
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28DB0]), sel_initRequiringSecureCoding_, 1);
  objc_msgSend(v4, sel_setOutputFormat_, 200);
  uint64_t v5 = (void *)sub_1A8A76538();
  objc_msgSend(v4, sel_encodeObject_forKey_, a2, v5);

  id v6 = objc_msgSend(v4, sel_encodedData);
  uint64_t v7 = sub_1A8A74A68();
  unint64_t v9 = v8;

  __swift_project_boxed_opaque_existential_1_0(a1, a1[3]);
  sub_1A8A78848();
  __swift_mutable_project_boxed_opaque_existential_1_0((uint64_t)v11, v12);
  sub_1A8A5529C();
  sub_1A8A785D8();

  sub_1A85135AC(v7, v9);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
}

uint64_t sub_1A8A672EC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1A8A678F0(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1A8A67318(void *a1)
{
  return Suggestion.encode(to:)(a1, *v1);
}

uint64_t Suggestion.id.getter(void *a1)
{
  id v1 = a1;
  id v2 = objc_msgSend(v1, sel_uniqueIdentifier);
  uint64_t v3 = sub_1A8A76558();

  return v3;
}

IMAPSearchIndexerXPC::Suggestion::ID __swiftcall Suggestion.ID.init(_:)(CSSuggestion a1)
{
  id v2 = [(objc_class *)a1.super.isa uniqueIdentifier];
  uint64_t v3 = sub_1A8A76558();
  uint64_t v5 = v4;

  uint64_t v6 = v3;
  uint64_t v7 = v5;
  result.underlying._object = v7;
  result.underlying._countAndFlagsBits = v6;
  return result;
}

uint64_t Suggestion.ID.hash(into:)()
{
  _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
  sub_1A8A762A8();
  return swift_bridgeObjectRelease();
}

uint64_t static Suggestion.ID.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4) {
    return 1;
  }
  else {
    return sub_1A8A78588();
  }
}

uint64_t Suggestion.ID.hashValue.getter()
{
  return sub_1A8A787C8();
}

void sub_1A8A674CC(uint64_t *a1@<X8>)
{
  id v3 = *v1;
  id v4 = objc_msgSend(v3, sel_uniqueIdentifier);
  uint64_t v5 = sub_1A8A76558();
  uint64_t v7 = v6;

  *a1 = v5;
  a1[1] = v7;
}

uint64_t _s20IMAPSearchIndexerXPC10SuggestionV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  id v3 = objc_msgSend(a1, sel_uniqueIdentifier);
  uint64_t v4 = sub_1A8A76558();
  uint64_t v6 = v5;

  id v7 = objc_msgSend(a2, sel_uniqueIdentifier);
  uint64_t v8 = sub_1A8A76558();
  uint64_t v10 = v9;

  if (v4 == v8 && v6 == v10) {
    char v12 = 1;
  }
  else {
    char v12 = sub_1A8A78588();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12 & 1;
}

id sub_1A8A67830()
{
  v6[1] = *(id *)MEMORY[0x1E4F143B8];
  id v1 = (void *)sub_1A8A74A48();
  v6[0] = 0;
  id v2 = objc_msgSend(v0, sel_initForReadingFromData_error_, v1, v6);

  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_1A8A747D8();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_1A8A678F0(void *a1)
{
  __swift_project_boxed_opaque_existential_1_0(a1, a1[3]);
  sub_1A8A78818();
  if (!v1)
  {
    __swift_project_boxed_opaque_existential_1_0(v10, v10[3]);
    sub_1A8A57624();
    sub_1A8A785B8();
    id v4 = objc_allocWithZone(MEMORY[0x1E4F28DC0]);
    sub_1A8512DFC(v8, v9);
    id v5 = sub_1A8A67830();
    sub_1A85135AC(v8, v9);
    objc_msgSend(v5, sel_setRequiresSecureCoding_, 1);
    sub_1A8A67C20();
    uint64_t v7 = sub_1A8A777B8();
    if (v7)
    {
      uint64_t v2 = v7;

      sub_1A85135AC(v8, v9);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      return v2;
    }
    sub_1A8A67C60();
    swift_allocError();
    swift_willThrow();

    sub_1A85135AC(v8, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v2;
}

uint64_t sub_1A8A67A90()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A8A67AC8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1A8A67AF0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1A8A67B54()
{
  unint64_t result = qword_1E974F278;
  if (!qword_1E974F278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F278);
  }
  return result;
}

unint64_t sub_1A8A67BAC()
{
  unint64_t result = qword_1E974F280;
  if (!qword_1E974F280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F280);
  }
  return result;
}

ValueMetadata *type metadata accessor for Suggestion()
{
  return &type metadata for Suggestion;
}

ValueMetadata *type metadata accessor for Suggestion.ID()
{
  return &type metadata for Suggestion.ID;
}

unint64_t sub_1A8A67C20()
{
  unint64_t result = qword_1E974F288;
  if (!qword_1E974F288)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E974F288);
  }
  return result;
}

unint64_t sub_1A8A67C60()
{
  unint64_t result = qword_1E974F290;
  if (!qword_1E974F290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F290);
  }
  return result;
}

ValueMetadata *type metadata accessor for Suggestion.WrongObject()
{
  return &type metadata for Suggestion.WrongObject;
}

uint64_t sub_1A8A67CC4()
{
  uint64_t v0 = sub_1A8A754D8();
  __swift_allocate_value_buffer_0(v0, qword_1E9746918);
  __swift_project_value_buffer_0(v0, (uint64_t)qword_1E9746918);
  return sub_1A8A754C8();
}

uint64_t sub_1A8A67D4C()
{
  __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E97471F8);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 24) = 0;
  *(void *)(result + 16) = 1;
  qword_1E9746900 = result;
  return result;
}

uint64_t *SyncSession.__allocating_init(generateCredentials:updateIndexingStatistics:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = a2;
  uint64_t v18 = a1;
  uint64_t v28 = a4;
  uint64_t v19 = a3;
  uint64_t v25 = sub_1A8A75518();
  uint64_t v22 = *(void *)(v25 - 8);
  uint64_t v23 = v22;
  MEMORY[0x1F4188790](v25);
  id v24 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_1A8A774C8();
  uint64_t v5 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1A8A77488();
  MEMORY[0x1F4188790](v8);
  uint64_t v9 = sub_1A8A75CE8();
  MEMORY[0x1F4188790](v9 - 8);
  unint64_t v20 = sub_1A8A681C8();
  sub_1A8A75CB8();
  uint64_t v29 = MEMORY[0x1E4FBC860];
  sub_1A8A697FC((unint64_t *)&unk_1E97489C0, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName_0((uint64_t *)&unk_1E9748948);
  sub_1A8561EB8((unint64_t *)&unk_1E9748980, (uint64_t *)&unk_1E9748948);
  sub_1A8A77BF8();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FBCC58], v21);
  uint64_t v10 = (void *)sub_1A8A77508();
  sub_1A8A75588();
  __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E97475A8);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1A8AD8F00;
  id v12 = v10;
  sub_1A8A75508();
  uint64_t v29 = v11;
  sub_1A8A697FC((unint64_t *)&qword_1E9746A00, MEMORY[0x1E4FBCEE0]);
  __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9746E88);
  sub_1A8561EB8((unint64_t *)&qword_1E9746E90, &qword_1E9746E88);
  sub_1A8A77BF8();
  uint64_t v13 = v26;
  uint64_t v14 = sub_1A8A754F8();
  if (v13)
  {

    swift_release();
    return (uint64_t *)swift_release();
  }
  else
  {
    uint64_t v16 = v14;
    swift_allocObject();
    return sub_1A8A68208(v16, v12, v18, v27, v19, v28);
  }
}

unint64_t sub_1A8A681C8()
{
  unint64_t result = qword_1E97488E8;
  if (!qword_1E97488E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E97488E8);
  }
  return result;
}

uint64_t *sub_1A8A68208(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v13 = *v7;
  v7[2] = (uint64_t)a2;
  v7[3] = a1;
  uint64_t v14 = v13;
  id v15 = (void *)swift_allocObject();
  v15[2] = v14;
  v15[3] = a3;
  v15[4] = a4;
  v15[5] = a5;
  v15[6] = a6;
  swift_retain_n();
  id v16 = a2;
  swift_retain();
  swift_retain();
  sub_1A8A75538();
  swift_release();
  swift_release();
  swift_retain();
  sub_1A8A75528();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  return v7;
}

void sub_1A8A68354(uint64_t a1)
{
  uint64_t v2 = sub_1A8A75598();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)v18 - v7;
  if (qword_1E9746930 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1A8A754D8();
  __swift_project_value_buffer_0(v9, (uint64_t)qword_1E9746918);
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v10(v8, a1, v2);
  uint64_t v11 = sub_1A8A754B8();
  os_log_type_t v12 = sub_1A8A77448();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138412290;
    v18[1] = v13 + 4;
    v10(v5, (uint64_t)v8, v2);
    sub_1A8A697FC(&qword_1E9746A08, MEMORY[0x1E4FBCEF0]);
    uint64_t v14 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v15, v5, v2);
    uint64_t v16 = sub_1A8A747C8();

    uint64_t v20 = v16;
    sub_1A8A77958();
    uint64_t v17 = v19;
    void *v19 = v16;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    _os_log_impl(&dword_1A7EFF000, v11, v12, "cancelled: %@", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9748748);
    swift_arrayDestroy();
    MEMORY[0x1AD0E4D00](v17, -1, -1);
    MEMORY[0x1AD0E4D00](v13, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
}

uint64_t SyncSession.deinit()
{
  uint64_t v1 = v0;
  if (qword_1E9746930 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1A8A754D8();
  __swift_project_value_buffer_0(v2, (uint64_t)qword_1E9746918);
  uint64_t v3 = sub_1A8A754B8();
  os_log_type_t v4 = sub_1A8A77468();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1A7EFF000, v3, v4, "deinit", v5, 2u);
    MEMORY[0x1AD0E4D00](v5, -1, -1);
  }

  sub_1A8A75568();
  swift_release();
  return v1;
}

uint64_t SyncSession.__deallocating_deinit()
{
  SyncSession.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1A8A68790@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t, unint64_t, uint64_t (*)(), uint64_t)@<X2>, uint64_t a3@<X3>, uint64_t (*a4)(uint64_t, uint64_t, uint64_t)@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v20 = a5;
  uint64_t v21 = a4;
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t v8 = sub_1A8A755C8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A8A5DB2C();
  sub_1A8A755B8();
  uint64_t v13 = v24;
  uint64_t v12 = v25;
  uint64_t v14 = v26;
  unsigned __int8 v15 = v27;
  int v16 = v27 >> 6;
  if (v16 == 3)
  {
    uint64_t result = v21(v24, v25, v26);
LABEL_5:
    *(void *)(a6 + 32) = 0;
    *(_OWORD *)a6 = 0u;
    *(_OWORD *)(a6 + 16) = 0u;
    return result;
  }
  if (v16 == 2)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
    unint64_t v18 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v19 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v19 + v18, v11, v8);
    sub_1A8A69960(v13, v12, (uint64_t)sub_1A8A698D4, v19, v22);
    sub_1A8A612D0(v13, v12, v14, v15);
    uint64_t result = swift_release();
    goto LABEL_5;
  }
  sub_1A8A612D0(v24, v25, v26, v27);
  uint64_t result = sub_1A8A780F8();
  __break(1u);
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SyncSession.activate()()
{
  sub_1A8A75578();
  if (v0)
  {
    if (qword_1E9746930 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_1A8A754D8();
    __swift_project_value_buffer_0(v1, (uint64_t)qword_1E9746918);
    id v2 = v0;
    id v3 = v0;
    os_log_type_t v4 = sub_1A8A754B8();
    os_log_type_t v5 = sub_1A8A77458();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 138412290;
      id v8 = v0;
      uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
      sub_1A8A77958();
      *uint64_t v7 = v13;

      _os_log_impl(&dword_1A7EFF000, v4, v5, "Could not activate XPCSession due to %@.", v6, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9748748);
      swift_arrayDestroy();
      MEMORY[0x1AD0E4D00](v7, -1, -1);
      MEMORY[0x1AD0E4D00](v6, -1, -1);
    }
    else
    {
    }
    swift_willThrow();
  }
  else
  {
    if (qword_1E9746930 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1A8A754D8();
    __swift_project_value_buffer_0(v9, (uint64_t)qword_1E9746918);
    uint64_t v10 = sub_1A8A754B8();
    os_log_type_t v11 = sub_1A8A77468();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1A7EFF000, v10, v11, "Activated XPCSession", v12, 2u);
      MEMORY[0x1AD0E4D00](v12, -1, -1);
    }
  }
}

Swift::Void __swiftcall SyncSession.cancel(reason:)(Swift::String reason)
{
  sub_1A8A75568();
  if (qword_1E9746930 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1A8A754D8();
  __swift_project_value_buffer_0(v1, (uint64_t)qword_1E9746918);
  oslog = sub_1A8A754B8();
  os_log_type_t v2 = sub_1A8A77468();
  if (os_log_type_enabled(oslog, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1A7EFF000, oslog, v2, "Cancelled XPCSession", v3, 2u);
    MEMORY[0x1AD0E4D00](v3, -1, -1);
  }
}

uint64_t SyncSession.start(configurations:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_1E9746908 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)(qword_1E9746900 + 16);
  uint64_t v7 = (os_unfair_lock_s *)(qword_1E9746900 + 24);
  swift_retain();
  os_unfair_lock_lock(v7);
  sub_1A8A69720(v6, v12);
  os_unfair_lock_unlock(v7);
  uint64_t v8 = v12[0];
  swift_release();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  *(void *)(v9 + 24) = a3;
  v12[0] = v8;
  v12[1] = a1;
  v12[2] = 0;
  uint64_t v12[3] = 0;
  char v13 = 0;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_1A8A69774;
  *(void *)(v10 + 24) = v9;
  sub_1A8A5DAD8();
  sub_1A8A5DB2C();
  swift_retain();
  swift_retain();
  sub_1A8A75548();
  swift_release();
  return swift_release();
}

void sub_1A8A69100(id a1, uint64_t a2, uint64_t a3, __int16 a4, void (*a5)(void))
{
  unsigned __int8 v6 = a4;
  if ((a4 & 0x100) != 0)
  {
    id v15 = a1;
    if (qword_1E9746930 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1A8A754D8();
    __swift_project_value_buffer_0(v16, (uint64_t)qword_1E9746918);
    id v17 = a1;
    unint64_t v18 = sub_1A8A754B8();
    os_log_type_t v19 = sub_1A8A77448();
    if (os_log_type_enabled(v18, v19))
    {
      unsigned __int8 v27 = a5;
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 138412290;
      uint64_t v28 = sub_1A8A747C8();
      sub_1A8A77958();
      *uint64_t v26 = v28;
      sub_1A8A66F18(a1, a2, a3, v6, 1);
      _os_log_impl(&dword_1A7EFF000, v18, v19, "Start download request failed: %@", v20, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9748748);
      swift_arrayDestroy();
      MEMORY[0x1AD0E4D00](v26, -1, -1);
      uint64_t v21 = v20;
      a5 = v27;
      MEMORY[0x1AD0E4D00](v21, -1, -1);
    }
    else
    {
      sub_1A8A66F18(a1, a2, a3, v6, 1);
    }

    a5(4);
    sub_1A8A66F18(a1, a2, a3, v6, 1);
  }
  else
  {
    if (a4 > 0x3Fu)
    {
      if (qword_1E9746930 != -1) {
        swift_once();
      }
      uint64_t v22 = sub_1A8A754D8();
      __swift_project_value_buffer_0(v22, (uint64_t)qword_1E9746918);
      uint64_t v23 = sub_1A8A754B8();
      os_log_type_t v24 = sub_1A8A77448();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v25 = 0;
        _os_log_impl(&dword_1A7EFF000, v23, v24, "Invalid response for start download request.", v25, 2u);
        MEMORY[0x1AD0E4D00](v25, -1, -1);
      }

      uint64_t v12 = 4;
    }
    else
    {
      if (qword_1E9746930 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_1A8A754D8();
      __swift_project_value_buffer_0(v8, (uint64_t)qword_1E9746918);
      uint64_t v9 = sub_1A8A754B8();
      os_log_type_t v10 = sub_1A8A77468();
      if (os_log_type_enabled(v9, v10))
      {
        os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v11 = 0;
        _os_log_impl(&dword_1A7EFF000, v9, v10, "Received response for start download request.", v11, 2u);
        MEMORY[0x1AD0E4D00](v11, -1, -1);
      }

      uint64_t v12 = (uint64_t)a1;
    }
    a5(v12);
  }
}

Swift::Void __swiftcall SyncSession.stop()()
{
  if (qword_1E9746908 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)(qword_1E9746900 + 16);
  uint64_t v1 = (os_unfair_lock_s *)(qword_1E9746900 + 24);
  swift_retain();
  os_unfair_lock_lock(v1);
  sub_1A8A69720(v0, &v3);
  os_unfair_lock_unlock(v1);
  uint64_t v2 = v3;
  swift_release();
  uint64_t v3 = v2;
  long long v4 = xmmword_1A8AD8FE0;
  uint64_t v5 = 0;
  char v6 = 0;
  sub_1A8A5DAD8();
  sub_1A8A75558();
}

void *sub_1A8A69720@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *result;
  if (__OFADD__(*result, 1))
  {
    __break(1u);
  }
  else
  {
    ++*result;
    *a2 = v2;
  }
  return result;
}

uint64_t sub_1A8A6973C()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1A8A69774(void *a1, uint64_t a2, uint64_t a3, __int16 a4)
{
  sub_1A8A69100(a1, a2, a3, a4 & 0x1FF, *(void (**)(void))(v4 + 16));
}

uint64_t type metadata accessor for SyncSession()
{
  return self;
}

uint64_t sub_1A8A697AC()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A8A697EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A8A68790(a1, *(void (**)(uint64_t, unint64_t, uint64_t (*)(), uint64_t))(v2 + 24), *(void *)(v2 + 32), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 40), *(void *)(v2 + 48), a2);
}

uint64_t sub_1A8A697FC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A8A69844()
{
  uint64_t v1 = sub_1A8A755C8();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1A8A698D4()
{
  return sub_1A8A755A8();
}

uint64_t sub_1A8A69960(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, unint64_t, uint64_t (*)(), uint64_t))
{
  if (qword_1E9746930 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1A8A754D8();
  __swift_project_value_buffer_0(v9, (uint64_t)qword_1E9746918);
  swift_bridgeObjectRetain_n();
  os_log_type_t v10 = sub_1A8A754B8();
  os_log_type_t v11 = sub_1A8A77468();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v17 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
    sub_1A8A667F8(a1, a2, &v17);
    sub_1A8A77958();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A7EFF000, v10, v11, "Responding to credential request for account %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E4D00](v13, -1, -1);
    MEMORY[0x1AD0E4D00](v12, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a3;
  *(void *)(v14 + 24) = a4;
  swift_retain();
  a5(a1, a2, sub_1A8A69B8C, v14);
  return swift_release();
}

uint64_t sub_1A8A69B8C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

BOOL static IndexingStatistics.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return a1 == a4 && a2 == a5 && a3 == a6;
}

uint64_t static Mailbox.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!_s13IMAP2Protocol13EncodedStringV2eeoiySbAC_ACtFZ_0(a1, a4)) {
    return 0;
  }
  if (a2 == a5 && a3 == a6) {
    return 1;
  }
  return sub_1A8A78588();
}

uint64_t SearchQuery.debugDescription.getter()
{
  sub_1A8A78028();
  sub_1A8A767E8();
  uint64_t v0 = _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
  MEMORY[0x1AD0DFD80](v0, &type metadata for Mailbox);
  sub_1A8A767E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t static IndexingStatistics.empty.getter()
{
  return 0;
}

uint64_t sub_1A8A69D4C()
{
  return sub_1A8A76C18();
}

uint64_t sub_1A8A69DAC()
{
  return sub_1A8A76BD8();
}

uint64_t Mailbox.accountID.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t Mailbox.hash(into:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  sub_1A8A78768();
  if (v3)
  {
    uint64_t v4 = a2 + 32;
    do
    {
      ++v4;
      sub_1A8A78778();
      --v3;
    }
    while (v3);
  }
  _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
  sub_1A8A762A8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A8A69EC0(char a1)
{
  if (a1) {
    return 0x49746E756F636361;
  }
  else {
    return 1701667182;
  }
}

uint64_t sub_1A8A69EF4()
{
  return sub_1A8A69EC0(*v0);
}

uint64_t sub_1A8A69EFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8A6AD24(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A8A69F24()
{
  sub_1A8A6ACD0();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A69F60()
{
  sub_1A8A6ACD0();
  return sub_1A8A78A58();
}

uint64_t Mailbox.encode(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = a4;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E97474D8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  os_log_type_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1_0(a1, a1[3]);
  sub_1A8A6ACD0();
  sub_1A8A78858();
  uint64_t v15 = a2;
  char v17 = 0;
  __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9740EF0);
  sub_1A8A6C080(&qword_1E9746F68);
  sub_1A8A78468();
  if (!v4)
  {
    uint64_t v15 = a3;
    uint64_t v16 = v14;
    char v17 = 1;
    sub_1A8A5114C();
    sub_1A8A78468();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t Mailbox.hashValue.getter(uint64_t a1)
{
  sub_1A8A78738();
  uint64_t v2 = *(void *)(a1 + 16);
  sub_1A8A78768();
  if (v2)
  {
    uint64_t v3 = a1 + 32;
    do
    {
      ++v3;
      sub_1A8A78778();
      --v2;
    }
    while (v2);
  }
  _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
  sub_1A8A762A8();
  swift_bridgeObjectRelease();
  return sub_1A8A787C8();
}

uint64_t Mailbox.init(from:)(uint64_t a1)
{
  return sub_1A8A6AA84(a1, (uint64_t (*)(void))sub_1A8A6AE08);
}

uint64_t sub_1A8A6A234@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1A8A6AE08(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_1A8A6A264(void *a1)
{
  return Mailbox.encode(to:)(a1, *v1, v1[1], v1[2]);
}

uint64_t sub_1A8A6A284()
{
  return Mailbox.hashValue.getter(*v0);
}

uint64_t sub_1A8A6A290(uint64_t a1)
{
  return Mailbox.hash(into:)(a1, *v1);
}

uint64_t sub_1A8A6A29C()
{
  uint64_t v1 = *v0;
  sub_1A8A78738();
  uint64_t v2 = *(void *)(v1 + 16);
  sub_1A8A78768();
  if (v2)
  {
    uint64_t v3 = v1 + 32;
    do
    {
      ++v3;
      sub_1A8A78778();
      --v2;
    }
    while (v2);
  }
  _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
  sub_1A8A762A8();
  swift_bridgeObjectRelease();
  return sub_1A8A787C8();
}

uint64_t SearchQuery.limit.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t SearchQuery.mailboxes.getter()
{
  return _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
}

uint64_t sub_1A8A6A34C(char a1)
{
  return *(void *)&aSuggestilimit[8 * a1];
}

uint64_t sub_1A8A6A36C()
{
  return sub_1A8A6A34C(*v0);
}

uint64_t sub_1A8A6A374@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8A6B0F4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A8A6A39C()
{
  sub_1A8A6B04C();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A6A3D8()
{
  sub_1A8A6B04C();
  return sub_1A8A78A58();
}

uint64_t SearchQuery.encode(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = a3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9747438);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  os_log_type_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1_0(a1, a1[3]);
  sub_1A8A6B04C();
  sub_1A8A78858();
  uint64_t v15 = a2;
  char v14 = 0;
  sub_1A8A6B0A0();
  sub_1A8A78468();
  if (!v4)
  {
    LOBYTE(v15) = 1;
    sub_1A8A78458();
    uint64_t v15 = a4;
    char v14 = 2;
    __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9746E78);
    sub_1A8A6C010(&qword_1E9746E80, (void (*)(void))sub_1A8A5FB44);
    sub_1A8A78468();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t SearchQuery.init(from:)(uint64_t a1)
{
  return sub_1A8A6AA84(a1, (uint64_t (*)(void))sub_1A8A6B244);
}

id sub_1A8A6A63C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id result = sub_1A8A6B244(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_1A8A6A66C(void *a1)
{
  return SearchQuery.encode(to:)(a1, *v1, v1[1], v1[2]);
}

uint64_t sub_1A8A6A68C(uint64_t a1, uint64_t a2)
{
  return _s20IMAPSearchIndexerXPC11SearchQueryV23__derived_struct_equalsySbAC_ACtFZ_0(*(void **)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void **)a2, *(void *)(a2 + 8), *(void *)(a2 + 16));
}

uint64_t SearchQuery.id.getter(void *a1)
{
  id v1 = a1;
  id v2 = objc_msgSend(v1, sel_uniqueIdentifier);
  uint64_t v3 = sub_1A8A76558();

  return v3;
}

uint64_t IndexingStatistics.totalMessages.setter(uint64_t result)
{
  *id v1 = result;
  return result;
}

double (*IndexingStatistics.totalMessages.modify())(void)
{
  return nullsub_1;
}

uint64_t IndexingStatistics.messagesIndexed.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t IndexingStatistics.messagesIndexed.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

double (*IndexingStatistics.messagesIndexed.modify())(void)
{
  return nullsub_1;
}

uint64_t IndexingStatistics.messagesNotIndexed.getter(uint64_t a1, uint64_t a2)
{
  BOOL v2 = __OFSUB__(a1, a2);
  uint64_t result = a1 - a2;
  if (v2) {
    __break(1u);
  }
  return result;
}

uint64_t IndexingStatistics.messagesInLargestAccount.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t IndexingStatistics.messagesInLargestAccount.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

double (*IndexingStatistics.messagesInLargestAccount.modify())(void)
{
  return nullsub_1;
}

uint64_t sub_1A8A6A7A4(char a1)
{
  if (!a1) {
    return 0x73654D6C61746F74;
  }
  if (a1 == 1) {
    return 0x736567617373656DLL;
  }
  return 0xD000000000000018;
}

uint64_t sub_1A8A6A818()
{
  return sub_1A8A6A7A4(*v0);
}

uint64_t sub_1A8A6A820@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8A6B51C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A8A6A848()
{
  sub_1A8A6B4C8();
  return sub_1A8A78A48();
}

uint64_t sub_1A8A6A884()
{
  sub_1A8A6B4C8();
  return sub_1A8A78A58();
}

uint64_t IndexingStatistics.encode(to:)(void *a1, uint64_t a2, uint64_t a3)
{
  v10[1] = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F298);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1_0(a1, a1[3]);
  sub_1A8A6B4C8();
  sub_1A8A78858();
  char v13 = 0;
  sub_1A8A78458();
  if (!v3)
  {
    char v12 = 1;
    sub_1A8A78458();
    char v11 = 2;
    sub_1A8A78458();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t IndexingStatistics.init(from:)(uint64_t a1)
{
  return sub_1A8A6AA84(a1, (uint64_t (*)(void))sub_1A8A6B690);
}

uint64_t sub_1A8A6AA84(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t result = a2();
  if (v2) {
    return v4;
  }
  return result;
}

uint64_t sub_1A8A6AAB0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1A8A6B690(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_1A8A6AAE0(void *a1)
{
  return IndexingStatistics.encode(to:)(a1, *v1, v1[1]);
}

double IndexingStatistics.fractionCompleted.getter(uint64_t a1, uint64_t a2)
{
  if (a1 < 1) {
    return 0.0;
  }
  else {
    return (double)a2 / (double)a1;
  }
}

uint64_t IndexingStatistics.fractionCompletedAsInt.getter(uint64_t result, uint64_t a2)
{
  if (result < 1) {
    double v2 = 0.0;
  }
  else {
    double v2 = (double)a2 / (double)result * 100.0;
  }
  double v3 = round(v2);
  if ((~*(void *)&v3 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v3 < 9.22337204e18) {
    return (uint64_t)v3;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1A8A6AB94()
{
  return SearchQuery.debugDescription.getter();
}

uint64_t _s20IMAPSearchIndexerXPC11SearchQueryV23__derived_struct_equalsySbAC_ACtFZ_0(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v11 = objc_msgSend(a1, sel_uniqueIdentifier);
  uint64_t v12 = sub_1A8A76558();
  uint64_t v14 = v13;

  id v15 = objc_msgSend(a4, sel_uniqueIdentifier);
  uint64_t v16 = sub_1A8A76558();
  uint64_t v18 = v17;

  if (v12 == v16 && v14 == v18)
  {
    swift_bridgeObjectRelease_n();
    if (a2 == a5) {
      goto LABEL_7;
    }
    return 0;
  }
  char v20 = sub_1A8A78588();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v20 & 1) == 0 || a2 != a5) {
    return 0;
  }
LABEL_7:
  return sub_1A8A59688(a3, a6);
}

unint64_t sub_1A8A6ACD0()
{
  unint64_t result = qword_1E9746938;
  if (!qword_1E9746938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746938);
  }
  return result;
}

uint64_t sub_1A8A6AD24(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v3 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x49746E756F636361 && a2 == 0xE900000000000044)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1A8A78588();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A8A6AE08(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F2D8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  char v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1_0(a1, v7);
  sub_1A8A6ACD0();
  sub_1A8A78828();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9740EF0);
    char v10 = 0;
    sub_1A8A6C080(&qword_1E974F2E0);
    sub_1A8A78378();
    uint64_t v7 = v9[1];
    char v10 = 1;
    sub_1A8A52924();
    _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
    sub_1A8A78378();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_1A8A6B04C()
{
  unint64_t result = qword_1E97465E8;
  if (!qword_1E97465E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97465E8);
  }
  return result;
}

unint64_t sub_1A8A6B0A0()
{
  unint64_t result = qword_1E9746560;
  if (!qword_1E9746560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746560);
  }
  return result;
}

uint64_t sub_1A8A6B0F4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6974736567677573 && a2 == 0xEA00000000006E6FLL;
  if (v3 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74696D696CLL && a2 == 0xE500000000000000 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65786F626C69616DLL && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1A8A78588();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

id sub_1A8A6B244(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E974F2C0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  char v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = (id)a1[3];
  __swift_project_boxed_opaque_existential_1_0(a1, (uint64_t)v7);
  sub_1A8A6B04C();
  sub_1A8A78828();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    HIBYTE(v10) = 0;
    sub_1A8A6BFBC();
    sub_1A8A78378();
    uint64_t v9 = v11;
    LOBYTE(v11) = 1;
    id v7 = v9;
    sub_1A8A78368();
    __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E9746E78);
    HIBYTE(v10) = 2;
    sub_1A8A6C010(&qword_1E974F2D0, (void (*)(void))sub_1A8A63EC0);
    sub_1A8A78378();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_1A8A6B4C8()
{
  unint64_t result = qword_1E97467F8;
  if (!qword_1E97467F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97467F8);
  }
  return result;
}

uint64_t sub_1A8A6B51C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x73654D6C61746F74 && a2 == 0xED00007365676173;
  if (v3 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x736567617373656DLL && a2 == 0xEF64657865646E49 || (sub_1A8A78588() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x80000001A8B40BA0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1A8A78588();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1A8A6B690(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName_0(&qword_1E97473C0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1_0(a1, a1[3]);
  sub_1A8A6B4C8();
  sub_1A8A78828();
  v8[15] = 0;
  uint64_t v6 = sub_1A8A78368();
  v8[14] = 1;
  sub_1A8A78368();
  v8[13] = 2;
  sub_1A8A78368();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v6;
}

unint64_t sub_1A8A6B860()
{
  unint64_t result = qword_1E9746960;
  if (!qword_1E9746960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746960);
  }
  return result;
}

__n128 __swift_memcpy24_8_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for Mailbox()
{
  return &type metadata for Mailbox;
}

uint64_t destroy for SearchQuery(id *a1)
{
  return swift_bridgeObjectRelease();
}

void *_s20IMAPSearchIndexerXPC11SearchQueryVwCP_0(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  id v5 = v3;
  _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
  return a1;
}

uint64_t assignWithCopy for SearchQuery(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SearchQuery(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for SearchQuery()
{
  return &type metadata for SearchQuery;
}

ValueMetadata *type metadata accessor for IndexingStatistics()
{
  return &type metadata for IndexingStatistics;
}

ValueMetadata *type metadata accessor for IndexingStatistics.CodingKeys()
{
  return &type metadata for IndexingStatistics.CodingKeys;
}

unsigned char *_s20IMAPSearchIndexerXPC18IndexingStatisticsV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *__n128 result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1A8A6BB14);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SearchQuery.CodingKeys()
{
  return &type metadata for SearchQuery.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for Mailbox.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1A8A6BC18);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Mailbox.CodingKeys()
{
  return &type metadata for Mailbox.CodingKeys;
}

unint64_t sub_1A8A6BC54()
{
  unint64_t result = qword_1E974F2A0;
  if (!qword_1E974F2A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F2A0);
  }
  return result;
}

unint64_t sub_1A8A6BCAC()
{
  unint64_t result = qword_1E974F2A8;
  if (!qword_1E974F2A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F2A8);
  }
  return result;
}

unint64_t sub_1A8A6BD04()
{
  unint64_t result = qword_1E974F2B0;
  if (!qword_1E974F2B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F2B0);
  }
  return result;
}

unint64_t sub_1A8A6BD5C()
{
  unint64_t result = qword_1E9746808;
  if (!qword_1E9746808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746808);
  }
  return result;
}

unint64_t sub_1A8A6BDB4()
{
  unint64_t result = qword_1E9746800;
  if (!qword_1E9746800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746800);
  }
  return result;
}

unint64_t sub_1A8A6BE0C()
{
  unint64_t result = qword_1E97465F8;
  if (!qword_1E97465F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97465F8);
  }
  return result;
}

unint64_t sub_1A8A6BE64()
{
  unint64_t result = qword_1E97465F0;
  if (!qword_1E97465F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97465F0);
  }
  return result;
}

unint64_t sub_1A8A6BEBC()
{
  unint64_t result = qword_1E9746948;
  if (!qword_1E9746948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746948);
  }
  return result;
}

unint64_t sub_1A8A6BF14()
{
  unint64_t result = qword_1E9746940;
  if (!qword_1E9746940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9746940);
  }
  return result;
}

unint64_t sub_1A8A6BF68()
{
  unint64_t result = qword_1E974F2B8;
  if (!qword_1E974F2B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F2B8);
  }
  return result;
}

unint64_t sub_1A8A6BFBC()
{
  unint64_t result = qword_1E974F2C8;
  if (!qword_1E974F2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E974F2C8);
  }
  return result;
}

uint64_t sub_1A8A6C010(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract_0(&qword_1E9746E78);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A8A6C080(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract_0(&qword_1E9740EF0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_1E979D438 == -1)
  {
    if (qword_1E979D440) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_1E979D438, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_1E979D440) {
      return _availability_version_check();
    }
  }
  if (qword_1E979D430 == -1)
  {
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_1E979D430, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_1E979D424 > a3) {
    return 1;
  }
  return dword_1E979D424 >= a3 && dword_1E979D428 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = qword_1E979D440;
  if (qword_1E979D440) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (MEMORY[0x1E4F143E8])
    {
      uint64_t v1 = MEMORY[0x1F4188798];
      qword_1E979D440 = MEMORY[0x1F4188798];
    }
    if (!v1 || result != 0)
    {
      uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        unsigned int v4 = *(unsigned __int8 **)result;
        uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          uint64_t v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            id v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  uint64_t v10 = (uint64_t (*)(uint64_t))result;
                  uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    id v11 = (uint64_t (*)(void))result;
                    uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    uint64_t v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        uint64_t v12 = (FILE *)result;
                        uint64_t result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          uint64_t v13 = (FILE *)result;
                          unsigned __int8 v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = MEMORY[0x1AD0E38D0](v13);
                          if (v14 < 0)
                          {
                            uint64_t v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            uint64_t v16 = malloc(v15);
                            if (v16)
                            {
                              uint64_t v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  os_log_type_t v19 = v13;
                                  if (v6) {
                                    uint64_t v20 = ((uint64_t (*)(void, uint64_t, void, void, void))v6)(0, v17, 0, 0, 0);
                                  }
                                  else {
                                    uint64_t v20 = v7(0, v17, 0, 0);
                                  }
                                  uint64_t v21 = v20;
                                  if (v20)
                                  {
                                    uint64_t v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      uint64_t v23 = v22;
                                      uint64_t v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        uint64_t v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984)) {
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_1E979D424, &dword_1E979D428);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    os_log_type_t v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  os_log_type_t v19 = v13;
                                }
                                uint64_t v16 = v26;
                              }
                              else
                              {
                                uint64_t v16 = v26;
                                os_log_type_t v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          os_log_type_t v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void copyAccountsForEmailAddress_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "#ACE-DB error retrieving configuration: %{public}@", buf, 0xCu);
}

void MFWalkUpDAErrorChain_cold_1()
{
}

void clearMailboxUIDCache_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1A7EFF000, v0, v1, "Clearing mailbox UID from account cache.", v2, v3, v4, v5, v6);
}

void _configureMailboxCache_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Not reading cached info for %{public}@", buf, 0xCu);
}

void _MFFlagsBySettingValueForKey_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_DEBUG, "Unexpected flag key \"%@\"", (uint8_t *)&v2, 0xCu);
}

void _createOutgoingMessageFromTopLevelMimePart_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "Cancelled message encryption", v2, v3, v4, v5, v6);
}

void _createOutgoingMessageFromTopLevelMimePart_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "Failed to encrypt message", v2, v3, v4, v5, v6);
}

void _createOutgoingMessageFromTopLevelMimePart_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "Cancelled message signing", v2, v3, v4, v5, v6);
}

void _createOutgoingMessageFromTopLevelMimePart_cold_4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "Failed to sign message", v2, v3, v4, v5, v6);
}

void _createOutgoingMessageFromTopLevelMimePart_cold_5()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "Failed to wrap message as message/rfc822", v2, v3, v4, v5, v6);
}

void _emailEqual_cold_1()
{
}

void _emailEqual_cold_2()
{
}

void fetchArgumentsForCriterion_cold_1(NSObject *a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(a1, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1A7EFF000, a1, OS_LOG_TYPE_DEFAULT, "#Warning need to handle criterion for IMAP search: %@", (uint8_t *)&v4, 0xCu);
  }
}

void rawAddress_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "wrong number of arguments (%d) to rawAddress", (uint8_t *)v2, 8u);
}

void displayName_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "wrong number of arguments (%d) to displayName", (uint8_t *)v2, 8u);
}

void _resetLocalAccountMboxCache_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_1A8A74348()
{
  return MEMORY[0x1F40E2E28]();
}

uint64_t sub_1A8A74358()
{
  return MEMORY[0x1F40E2E50]();
}

uint64_t sub_1A8A74368()
{
  return MEMORY[0x1F40E2F70]();
}

uint64_t sub_1A8A74378()
{
  return MEMORY[0x1F40E2FB8]();
}

uint64_t sub_1A8A74388()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1A8A74398()
{
  return MEMORY[0x1F40E3058]();
}

uint64_t sub_1A8A743A8()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1A8A743B8()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1A8A743C8()
{
  return MEMORY[0x1F40E3080]();
}

uint64_t sub_1A8A743D8()
{
  return MEMORY[0x1F40E30A0]();
}

uint64_t sub_1A8A743E8()
{
  return MEMORY[0x1F40E30A8]();
}

uint64_t sub_1A8A743F8()
{
  return MEMORY[0x1F40E30C0]();
}

uint64_t sub_1A8A74408()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1A8A74418()
{
  return MEMORY[0x1F40E3140]();
}

uint64_t sub_1A8A74428()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1A8A74438()
{
  return MEMORY[0x1F40E3288]();
}

uint64_t sub_1A8A74448()
{
  return MEMORY[0x1F40E3298]();
}

uint64_t sub_1A8A74458()
{
  return MEMORY[0x1F40E32B0]();
}

uint64_t sub_1A8A74468()
{
  return MEMORY[0x1F40E32E8]();
}

uint64_t sub_1A8A74478()
{
  return MEMORY[0x1F40E3318]();
}

uint64_t sub_1A8A74488()
{
  return MEMORY[0x1F40E3368]();
}

uint64_t sub_1A8A74498()
{
  return MEMORY[0x1F40E33F0]();
}

uint64_t sub_1A8A744A8()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1A8A744B8()
{
  return MEMORY[0x1F40E3470]();
}

uint64_t sub_1A8A744C8()
{
  return MEMORY[0x1F40E3540]();
}

uint64_t sub_1A8A744D8()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1A8A744E8()
{
  return MEMORY[0x1F40E3560]();
}

uint64_t sub_1A8A744F8()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1A8A74508()
{
  return MEMORY[0x1F40E36D8]();
}

uint64_t sub_1A8A74518()
{
  return MEMORY[0x1F40E36F8]();
}

uint64_t sub_1A8A74528()
{
  return MEMORY[0x1F40E3718]();
}

uint64_t sub_1A8A74538()
{
  return MEMORY[0x1F40E3760]();
}

uint64_t sub_1A8A74548()
{
  return MEMORY[0x1F40E37A8]();
}

uint64_t sub_1A8A74558()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1A8A74568()
{
  return MEMORY[0x1F40E37C0]();
}

uint64_t sub_1A8A74578()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t sub_1A8A74588()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1A8A74598()
{
  return MEMORY[0x1F40E37F0]();
}

uint64_t sub_1A8A745A8()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1A8A745B8()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1A8A745C8()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1A8A745D8()
{
  return MEMORY[0x1F40E38F8]();
}

uint64_t sub_1A8A745E8()
{
  return MEMORY[0x1F40E3948]();
}

uint64_t sub_1A8A745F8()
{
  return MEMORY[0x1F40E3970]();
}

uint64_t sub_1A8A74608()
{
  return MEMORY[0x1F40E3988]();
}

uint64_t sub_1A8A74618()
{
  return MEMORY[0x1F40E39B0]();
}

uint64_t sub_1A8A74628()
{
  return MEMORY[0x1F40E39C8]();
}

uint64_t sub_1A8A74638()
{
  return MEMORY[0x1F40E39F8]();
}

uint64_t sub_1A8A74648()
{
  return MEMORY[0x1F40E3A10]();
}

uint64_t sub_1A8A74658()
{
  return MEMORY[0x1F40E3A40]();
}

uint64_t sub_1A8A74668()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1A8A74678()
{
  return MEMORY[0x1F40E3B70]();
}

uint64_t sub_1A8A74688()
{
  return MEMORY[0x1F40E3B80]();
}

uint64_t sub_1A8A74698()
{
  return MEMORY[0x1F40E3B88]();
}

uint64_t sub_1A8A746A8()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1A8A746B8()
{
  return MEMORY[0x1F40E3FD0]();
}

uint64_t sub_1A8A746C8()
{
  return MEMORY[0x1F40E3FE0]();
}

uint64_t sub_1A8A746D8()
{
  return MEMORY[0x1F40E3FE8]();
}

uint64_t sub_1A8A746E8()
{
  return MEMORY[0x1F40E4008]();
}

uint64_t sub_1A8A746F8()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t sub_1A8A74708()
{
  return MEMORY[0x1F40E4200]();
}

uint64_t sub_1A8A74718()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t sub_1A8A74728()
{
  return MEMORY[0x1F40E4228]();
}

uint64_t sub_1A8A74738()
{
  return MEMORY[0x1F40E4240]();
}

uint64_t sub_1A8A74748()
{
  return MEMORY[0x1F40E4258]();
}

uint64_t sub_1A8A74758()
{
  return MEMORY[0x1F40E4260]();
}

uint64_t sub_1A8A74768()
{
  return MEMORY[0x1F40E4270]();
}

uint64_t sub_1A8A74778()
{
  return MEMORY[0x1F40E4280]();
}

uint64_t sub_1A8A74788()
{
  return MEMORY[0x1F40E4288]();
}

uint64_t sub_1A8A74798()
{
  return MEMORY[0x1F40E4290]();
}

uint64_t sub_1A8A747A8()
{
  return MEMORY[0x1F40E4298]();
}

uint64_t sub_1A8A747B8()
{
  return MEMORY[0x1F40E44F8]();
}

uint64_t sub_1A8A747C8()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1A8A747D8()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1A8A747E8()
{
  return MEMORY[0x1F40E4620]();
}

uint64_t sub_1A8A747F8()
{
  return MEMORY[0x1F40E4670]();
}

uint64_t sub_1A8A74808()
{
  return MEMORY[0x1F40E47F0]();
}

uint64_t sub_1A8A74818()
{
  return MEMORY[0x1F40E4810]();
}

uint64_t sub_1A8A74828()
{
  return MEMORY[0x1F40E4878]();
}

uint64_t sub_1A8A74838()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_1A8A74848()
{
  return MEMORY[0x1F40E48E8]();
}

uint64_t sub_1A8A74858()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1A8A74868()
{
  return MEMORY[0x1F40E4908]();
}

uint64_t sub_1A8A74878()
{
  return MEMORY[0x1F40E4918]();
}

uint64_t sub_1A8A74888()
{
  return MEMORY[0x1F40E4930]();
}

uint64_t sub_1A8A74898()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1A8A748A8()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t sub_1A8A748B8()
{
  return MEMORY[0x1F40E49F8]();
}

uint64_t sub_1A8A748C8()
{
  return MEMORY[0x1F40E4A10]();
}

uint64_t sub_1A8A748D8()
{
  return MEMORY[0x1F40E4A18]();
}

uint64_t sub_1A8A748E8()
{
  return MEMORY[0x1F40E4A28]();
}

uint64_t sub_1A8A748F8()
{
  return MEMORY[0x1F40E4A50]();
}

uint64_t sub_1A8A74908()
{
  return MEMORY[0x1F40E4A58]();
}

uint64_t sub_1A8A74918()
{
  return MEMORY[0x1F40E4A60]();
}

uint64_t sub_1A8A74928()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1A8A74938()
{
  return MEMORY[0x1F40E4AA0]();
}

uint64_t sub_1A8A74948()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1A8A74958()
{
  return MEMORY[0x1F40E4B00]();
}

uint64_t sub_1A8A74968()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1A8A74978()
{
  return MEMORY[0x1F40E4B30]();
}

uint64_t sub_1A8A74988()
{
  return MEMORY[0x1F40E4B58]();
}

uint64_t sub_1A8A74998()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1A8A749A8()
{
  return MEMORY[0x1F40E4BA8]();
}

uint64_t sub_1A8A749B8()
{
  return MEMORY[0x1F40E4BC8]();
}

uint64_t sub_1A8A749C8()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_1A8A749D8()
{
  return MEMORY[0x1F40E4C08]();
}

uint64_t sub_1A8A749E8()
{
  return MEMORY[0x1F40E4C58]();
}

uint64_t sub_1A8A749F8()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t sub_1A8A74A08()
{
  return MEMORY[0x1F40E4CA8]();
}

uint64_t sub_1A8A74A18()
{
  return MEMORY[0x1F40E4CD0]();
}

uint64_t sub_1A8A74A28()
{
  return MEMORY[0x1F40E4CD8]();
}

uint64_t sub_1A8A74A38()
{
  return MEMORY[0x1F40E4D30]();
}

uint64_t sub_1A8A74A48()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1A8A74A58()
{
  return MEMORY[0x1F40E4D80]();
}

uint64_t sub_1A8A74A68()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1A8A74A78()
{
  return MEMORY[0x1F40E4DB8]();
}

uint64_t sub_1A8A74A88()
{
  return MEMORY[0x1F40E4DF0]();
}

uint64_t sub_1A8A74A98()
{
  return MEMORY[0x1F40E4E00]();
}

uint64_t sub_1A8A74AA8()
{
  return MEMORY[0x1F40E4E10]();
}

uint64_t sub_1A8A74AB8()
{
  return MEMORY[0x1F40E4E18]();
}

uint64_t sub_1A8A74AC8()
{
  return MEMORY[0x1F40E4E20]();
}

uint64_t sub_1A8A74AD8()
{
  return MEMORY[0x1F40E4E30]();
}

uint64_t sub_1A8A74AE8()
{
  return MEMORY[0x1F40E4E40]();
}

uint64_t sub_1A8A74AF8()
{
  return MEMORY[0x1F40E4E60]();
}

uint64_t sub_1A8A74B08()
{
  return MEMORY[0x1F40E4E80]();
}

uint64_t sub_1A8A74B18()
{
  return MEMORY[0x1F40E4EA8]();
}

uint64_t sub_1A8A74B28()
{
  return MEMORY[0x1F40E4EB0]();
}

uint64_t sub_1A8A74B38()
{
  return MEMORY[0x1F40E4EB8]();
}

uint64_t sub_1A8A74B48()
{
  return MEMORY[0x1F40E4ED0]();
}

uint64_t sub_1A8A74B58()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1A8A74B68()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1A8A74B78()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1A8A74B88()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1A8A74B98()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1A8A74BA8()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1A8A74BB8()
{
  return MEMORY[0x1F40E51D8]();
}

uint64_t sub_1A8A74BC8()
{
  return MEMORY[0x1F40E51F0]();
}

uint64_t sub_1A8A74BD8()
{
  return MEMORY[0x1F40E52A0]();
}

uint64_t sub_1A8A74BE8()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1A8A74BF8()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1A8A74C08()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1A8A74C18()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1A8A74C28()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1A8A74C38()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1A8A74C48()
{
  return MEMORY[0x1F40E53A0]();
}

uint64_t sub_1A8A74C58()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1A8A74C68()
{
  return MEMORY[0x1F40E5418]();
}

uint64_t sub_1A8A74C78()
{
  return MEMORY[0x1F40E5428]();
}

uint64_t sub_1A8A74C88()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1A8A74C98()
{
  return MEMORY[0x1F40E5500]();
}

uint64_t sub_1A8A74CA8()
{
  return MEMORY[0x1F40E5648]();
}

uint64_t sub_1A8A74CB8()
{
  return MEMORY[0x1F40E5658]();
}

uint64_t sub_1A8A74CC8()
{
  return MEMORY[0x1F40E5698]();
}

uint64_t sub_1A8A74CD8()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1A8A74CE8()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1A8A74CF8()
{
  return MEMORY[0x1F40E58A8]();
}

uint64_t sub_1A8A74D08()
{
  return MEMORY[0x1F40E58B0]();
}

uint64_t sub_1A8A74D18()
{
  return MEMORY[0x1F40E5978]();
}

uint64_t sub_1A8A74D28()
{
  return MEMORY[0x1F40E5A40]();
}

uint64_t sub_1A8A74D38()
{
  return MEMORY[0x1F40E5AE0]();
}

uint64_t sub_1A8A74D48()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1A8A74D58()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1A8A74D68()
{
  return MEMORY[0x1F40E5B50]();
}

uint64_t sub_1A8A74D78()
{
  return MEMORY[0x1F40E5B68]();
}

uint64_t sub_1A8A74D88()
{
  return MEMORY[0x1F40E5BA0]();
}

uint64_t sub_1A8A74D98()
{
  return MEMORY[0x1F40E5BB0]();
}

uint64_t sub_1A8A74DA8()
{
  return MEMORY[0x1F40E5BC0]();
}

uint64_t sub_1A8A74DB8()
{
  return MEMORY[0x1F40E5BD0]();
}

uint64_t sub_1A8A74DC8()
{
  return MEMORY[0x1F40E5BF8]();
}

uint64_t sub_1A8A74DD8()
{
  return MEMORY[0x1F40E5C00]();
}

uint64_t sub_1A8A74DE8()
{
  return MEMORY[0x1F40E5C08]();
}

uint64_t sub_1A8A74DF8()
{
  return MEMORY[0x1F40E5C58]();
}

uint64_t sub_1A8A74E08()
{
  return MEMORY[0x1F40E5C78]();
}

uint64_t sub_1A8A74E18()
{
  return MEMORY[0x1F40E5C88]();
}

uint64_t sub_1A8A74E28()
{
  return MEMORY[0x1F40E5C98]();
}

uint64_t sub_1A8A74E38()
{
  return MEMORY[0x1F40E5CA8]();
}

uint64_t sub_1A8A74E48()
{
  return MEMORY[0x1F40E5CF8]();
}

uint64_t sub_1A8A74E58()
{
  return MEMORY[0x1F40E5D08]();
}

uint64_t sub_1A8A74E68()
{
  return MEMORY[0x1F40E5D20]();
}

uint64_t sub_1A8A74E78()
{
  return MEMORY[0x1F40E5D28]();
}

uint64_t sub_1A8A74E88()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1A8A74E98()
{
  return MEMORY[0x1F4187458]();
}

uint64_t sub_1A8A74EA8()
{
  return MEMORY[0x1F4187460]();
}

uint64_t sub_1A8A74EB8()
{
  return MEMORY[0x1F4187498]();
}

uint64_t sub_1A8A74EC8()
{
  return MEMORY[0x1F4117890]();
}

uint64_t sub_1A8A74ED8()
{
  return MEMORY[0x1F4117898]();
}

uint64_t sub_1A8A74EE8()
{
  return MEMORY[0x1F41178A0]();
}

uint64_t sub_1A8A74EF8()
{
  return MEMORY[0x1F41178A8]();
}

uint64_t sub_1A8A74F08()
{
  return MEMORY[0x1F41178B0]();
}

uint64_t sub_1A8A74F18()
{
  return MEMORY[0x1F41178B8]();
}

uint64_t sub_1A8A74F28()
{
  return MEMORY[0x1F41178C0]();
}

uint64_t sub_1A8A74F38()
{
  return MEMORY[0x1F41178C8]();
}

uint64_t sub_1A8A74F48()
{
  return MEMORY[0x1F41178D0]();
}

uint64_t sub_1A8A74F58()
{
  return MEMORY[0x1F41178D8]();
}

uint64_t sub_1A8A74F68()
{
  return MEMORY[0x1F41178E0]();
}

uint64_t sub_1A8A74F78()
{
  return MEMORY[0x1F41178E8]();
}

uint64_t sub_1A8A74F88()
{
  return MEMORY[0x1F41178F0]();
}

uint64_t sub_1A8A74F98()
{
  return MEMORY[0x1F41178F8]();
}

uint64_t sub_1A8A74FA8()
{
  return MEMORY[0x1F412C4E0]();
}

uint64_t sub_1A8A74FB8()
{
  return MEMORY[0x1F412C4E8]();
}

uint64_t sub_1A8A74FC8()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_1A8A74FD8()
{
  return MEMORY[0x1F4112640]();
}

uint64_t sub_1A8A74FE8()
{
  return MEMORY[0x1F4112648]();
}

uint64_t sub_1A8A74FF8()
{
  return MEMORY[0x1F4112650]();
}

uint64_t sub_1A8A75008()
{
  return MEMORY[0x1F4112660]();
}

uint64_t sub_1A8A75018()
{
  return MEMORY[0x1F41126B0]();
}

uint64_t sub_1A8A75028()
{
  return MEMORY[0x1F41126B8]();
}

uint64_t sub_1A8A75038()
{
  return MEMORY[0x1F41126C0]();
}

uint64_t sub_1A8A75048()
{
  return MEMORY[0x1F41126E8]();
}

uint64_t sub_1A8A75058()
{
  return MEMORY[0x1F41126F0]();
}

uint64_t sub_1A8A75068()
{
  return MEMORY[0x1F41126F8]();
}

uint64_t sub_1A8A75078()
{
  return MEMORY[0x1F4112708]();
}

uint64_t sub_1A8A75088()
{
  return MEMORY[0x1F4112710]();
}

uint64_t sub_1A8A75098()
{
  return MEMORY[0x1F4112720]();
}

uint64_t sub_1A8A750A8()
{
  return MEMORY[0x1F4112728]();
}

uint64_t sub_1A8A750B8()
{
  return MEMORY[0x1F4112730]();
}

uint64_t sub_1A8A750C8()
{
  return MEMORY[0x1F4112860]();
}

uint64_t sub_1A8A750D8()
{
  return MEMORY[0x1F4112868]();
}

uint64_t sub_1A8A750E8()
{
  return MEMORY[0x1F40E05E0]();
}

uint64_t sub_1A8A750F8()
{
  return MEMORY[0x1F40E05E8]();
}

uint64_t sub_1A8A75108()
{
  return MEMORY[0x1F4187848]();
}

uint64_t sub_1A8A75118()
{
  return MEMORY[0x1F4187858]();
}

uint64_t sub_1A8A75128()
{
  return MEMORY[0x1F4187880]();
}

uint64_t sub_1A8A75138()
{
  return MEMORY[0x1F41878A8]();
}

uint64_t sub_1A8A75148()
{
  return MEMORY[0x1F41878B0]();
}

uint64_t sub_1A8A75158()
{
  return MEMORY[0x1F41878B8]();
}

uint64_t sub_1A8A75168()
{
  return MEMORY[0x1F41878C8]();
}

uint64_t sub_1A8A75178()
{
  return MEMORY[0x1F41878E0]();
}

uint64_t sub_1A8A75188()
{
  return MEMORY[0x1F41878F8]();
}

uint64_t sub_1A8A75198()
{
  return MEMORY[0x1F4187900]();
}

uint64_t sub_1A8A751A8()
{
  return MEMORY[0x1F4187908]();
}

uint64_t sub_1A8A751B8()
{
  return MEMORY[0x1F4187910]();
}

uint64_t sub_1A8A751C8()
{
  return MEMORY[0x1F4187920]();
}

uint64_t sub_1A8A751D8()
{
  return MEMORY[0x1F4187930]();
}

uint64_t sub_1A8A751E8()
{
  return MEMORY[0x1F4187938]();
}

uint64_t sub_1A8A751F8()
{
  return MEMORY[0x1F4187940]();
}

uint64_t sub_1A8A75208()
{
  return MEMORY[0x1F4187958]();
}

uint64_t sub_1A8A75218()
{
  return MEMORY[0x1F41879B0]();
}

uint64_t sub_1A8A75228()
{
  return MEMORY[0x1F41879C8]();
}

uint64_t sub_1A8A75238()
{
  return MEMORY[0x1F41879D8]();
}

uint64_t sub_1A8A75248()
{
  return MEMORY[0x1F41879E0]();
}

uint64_t sub_1A8A75258()
{
  return MEMORY[0x1F41879E8]();
}

uint64_t sub_1A8A75268()
{
  return MEMORY[0x1F41879F0]();
}

uint64_t sub_1A8A75278()
{
  return MEMORY[0x1F41879F8]();
}

uint64_t sub_1A8A75288()
{
  return MEMORY[0x1F4187A08]();
}

uint64_t sub_1A8A75298()
{
  return MEMORY[0x1F4187A18]();
}

uint64_t sub_1A8A752A8()
{
  return MEMORY[0x1F4188520]();
}

uint64_t sub_1A8A752B8()
{
  return MEMORY[0x1F4188528]();
}

uint64_t sub_1A8A752C8()
{
  return MEMORY[0x1F4188530]();
}

uint64_t sub_1A8A752D8()
{
  return MEMORY[0x1F4188538]();
}

uint64_t sub_1A8A752E8()
{
  return MEMORY[0x1F4188540]();
}

uint64_t sub_1A8A752F8()
{
  return MEMORY[0x1F4188548]();
}

uint64_t sub_1A8A75308()
{
  return MEMORY[0x1F4188550]();
}

uint64_t sub_1A8A75318()
{
  return MEMORY[0x1F4188558]();
}

uint64_t sub_1A8A75328()
{
  return MEMORY[0x1F4188570]();
}

uint64_t sub_1A8A75338()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1A8A75358()
{
  return MEMORY[0x1F41885A8]();
}

uint64_t sub_1A8A75368()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t sub_1A8A75378()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_1A8A75388()
{
  return MEMORY[0x1F41885D8]();
}

uint64_t sub_1A8A75398()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t sub_1A8A753A8()
{
  return MEMORY[0x1F41885E8]();
}

uint64_t sub_1A8A753B8()
{
  return MEMORY[0x1F41885F0]();
}

uint64_t sub_1A8A753C8()
{
  return MEMORY[0x1F41885F8]();
}

uint64_t sub_1A8A753D8()
{
  return MEMORY[0x1F4188600]();
}

uint64_t sub_1A8A753E8()
{
  return MEMORY[0x1F4188608]();
}

uint64_t sub_1A8A753F8()
{
  return MEMORY[0x1F4188610]();
}

uint64_t sub_1A8A75408()
{
  return MEMORY[0x1F4188618]();
}

uint64_t sub_1A8A75418()
{
  return MEMORY[0x1F4188620]();
}

uint64_t sub_1A8A75428()
{
  return MEMORY[0x1F4188628]();
}

uint64_t sub_1A8A75438()
{
  return MEMORY[0x1F4188630]();
}

uint64_t sub_1A8A75448()
{
  return MEMORY[0x1F4188638]();
}

uint64_t sub_1A8A75458()
{
  return MEMORY[0x1F4188640]();
}

uint64_t sub_1A8A75468()
{
  return MEMORY[0x1F4188648]();
}

uint64_t sub_1A8A75478()
{
  return MEMORY[0x1F4188650]();
}

uint64_t sub_1A8A75488()
{
  return MEMORY[0x1F4188658]();
}

uint64_t sub_1A8A75498()
{
  return MEMORY[0x1F4188660]();
}

uint64_t sub_1A8A754A8()
{
  return MEMORY[0x1F4188668]();
}

uint64_t sub_1A8A754B8()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1A8A754C8()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1A8A754D8()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1A8A754E8()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1A8A754F8()
{
  return MEMORY[0x1F4187AD0]();
}

uint64_t sub_1A8A75508()
{
  return MEMORY[0x1F4187AE8]();
}

uint64_t sub_1A8A75518()
{
  return MEMORY[0x1F4187AF0]();
}

uint64_t sub_1A8A75528()
{
  return MEMORY[0x1F4187AF8]();
}

uint64_t sub_1A8A75538()
{
  return MEMORY[0x1F4187B00]();
}

uint64_t sub_1A8A75548()
{
  return MEMORY[0x1F4187B10]();
}

uint64_t sub_1A8A75558()
{
  return MEMORY[0x1F4187B18]();
}

uint64_t sub_1A8A75568()
{
  return MEMORY[0x1F4187B20]();
}

uint64_t sub_1A8A75578()
{
  return MEMORY[0x1F4187B28]();
}

uint64_t sub_1A8A75588()
{
  return MEMORY[0x1F4187B30]();
}

uint64_t sub_1A8A75598()
{
  return MEMORY[0x1F4187B70]();
}

uint64_t sub_1A8A755A8()
{
  return MEMORY[0x1F4187BC8]();
}

uint64_t sub_1A8A755B8()
{
  return MEMORY[0x1F4187BD0]();
}

uint64_t sub_1A8A755C8()
{
  return MEMORY[0x1F4187BE0]();
}

uint64_t sub_1A8A755D8()
{
  return MEMORY[0x1F4186B60]();
}

uint64_t sub_1A8A755E8()
{
  return MEMORY[0x1F4188490]();
}

uint64_t sub_1A8A755F8()
{
  return MEMORY[0x1F41884A0]();
}

uint64_t sub_1A8A75608()
{
  return MEMORY[0x1F41884A8]();
}

uint64_t sub_1A8A75618()
{
  return MEMORY[0x1F4186B88]();
}

uint64_t sub_1A8A75628()
{
  return MEMORY[0x1F41884E8]();
}

uint64_t sub_1A8A75638()
{
  return MEMORY[0x1F4187770]();
}

uint64_t sub_1A8A75648()
{
  return MEMORY[0x1F4187778]();
}

uint64_t sub_1A8A75658()
{
  return MEMORY[0x1F40F1F00]();
}

uint64_t sub_1A8A75668()
{
  return MEMORY[0x1F40F1F10]();
}

uint64_t sub_1A8A75678()
{
  return MEMORY[0x1F40F1F20]();
}

uint64_t sub_1A8A75688()
{
  return MEMORY[0x1F40F1F28]();
}

uint64_t sub_1A8A75698()
{
  return MEMORY[0x1F40F1F30]();
}

uint64_t sub_1A8A756A8()
{
  return MEMORY[0x1F40F1F38]();
}

uint64_t sub_1A8A756B8()
{
  return MEMORY[0x1F40F1F48]();
}

uint64_t sub_1A8A756C8()
{
  return MEMORY[0x1F40F1F58]();
}

uint64_t sub_1A8A756D8()
{
  return MEMORY[0x1F40F1FF0]();
}

uint64_t sub_1A8A756E8()
{
  return MEMORY[0x1F40F2010]();
}

uint64_t sub_1A8A756F8()
{
  return MEMORY[0x1F40F2018]();
}

uint64_t sub_1A8A75708()
{
  return MEMORY[0x1F40F2038]();
}

uint64_t sub_1A8A75718()
{
  return MEMORY[0x1F40F2078]();
}

uint64_t sub_1A8A75728()
{
  return MEMORY[0x1F40F2098]();
}

uint64_t sub_1A8A75738()
{
  return MEMORY[0x1F40F20A0]();
}

uint64_t sub_1A8A75748()
{
  return MEMORY[0x1F40F20A8]();
}

uint64_t sub_1A8A75758()
{
  return MEMORY[0x1F40F20C8]();
}

uint64_t sub_1A8A75768()
{
  return MEMORY[0x1F40F20D0]();
}

uint64_t sub_1A8A75778()
{
  return MEMORY[0x1F40F20E0]();
}

uint64_t sub_1A8A75788()
{
  return MEMORY[0x1F40F20F0]();
}

uint64_t sub_1A8A75798()
{
  return MEMORY[0x1F40F2100]();
}

uint64_t sub_1A8A757A8()
{
  return MEMORY[0x1F40F2108]();
}

uint64_t sub_1A8A757B8()
{
  return MEMORY[0x1F40F2110]();
}

uint64_t sub_1A8A757C8()
{
  return MEMORY[0x1F40F2130]();
}

uint64_t sub_1A8A757D8()
{
  return MEMORY[0x1F40F2140]();
}

uint64_t sub_1A8A757E8()
{
  return MEMORY[0x1F40F2158]();
}

uint64_t sub_1A8A757F8()
{
  return MEMORY[0x1F40F2168]();
}

uint64_t sub_1A8A75808()
{
  return MEMORY[0x1F40F2170]();
}

uint64_t sub_1A8A75818()
{
  return MEMORY[0x1F40F2180]();
}

uint64_t sub_1A8A75828()
{
  return MEMORY[0x1F40F21D8]();
}

uint64_t sub_1A8A75838()
{
  return MEMORY[0x1F40F21E0]();
}

uint64_t sub_1A8A75848()
{
  return MEMORY[0x1F40F21E8]();
}

uint64_t sub_1A8A75858()
{
  return MEMORY[0x1F40F21F0]();
}

uint64_t sub_1A8A75868()
{
  return MEMORY[0x1F40F2208]();
}

uint64_t sub_1A8A75878()
{
  return MEMORY[0x1F40F2228]();
}

uint64_t sub_1A8A75888()
{
  return MEMORY[0x1F40F2230]();
}

uint64_t sub_1A8A75898()
{
  return MEMORY[0x1F40F2248]();
}

uint64_t sub_1A8A758A8()
{
  return MEMORY[0x1F40F2250]();
}

uint64_t sub_1A8A758B8()
{
  return MEMORY[0x1F40F2260]();
}

uint64_t sub_1A8A758C8()
{
  return MEMORY[0x1F40F2278]();
}

uint64_t sub_1A8A758D8()
{
  return MEMORY[0x1F40F2280]();
}

uint64_t sub_1A8A758E8()
{
  return MEMORY[0x1F40F22A0]();
}

uint64_t sub_1A8A758F8()
{
  return MEMORY[0x1F40F22B8]();
}

uint64_t sub_1A8A75908()
{
  return MEMORY[0x1F40F22C8]();
}

uint64_t sub_1A8A75918()
{
  return MEMORY[0x1F40F22D8]();
}

uint64_t sub_1A8A75928()
{
  return MEMORY[0x1F40F22E0]();
}

uint64_t sub_1A8A75938()
{
  return MEMORY[0x1F40F22E8]();
}

uint64_t sub_1A8A75948()
{
  return MEMORY[0x1F40F2300]();
}

uint64_t sub_1A8A75958()
{
  return MEMORY[0x1F40F2318]();
}

uint64_t sub_1A8A75968()
{
  return MEMORY[0x1F40F2320]();
}

uint64_t sub_1A8A75978()
{
  return MEMORY[0x1F40F2328]();
}

uint64_t sub_1A8A75988()
{
  return MEMORY[0x1F40F2340]();
}

uint64_t sub_1A8A75998()
{
  return MEMORY[0x1F40F2360]();
}

uint64_t sub_1A8A759A8()
{
  return MEMORY[0x1F40F2370]();
}

uint64_t sub_1A8A759B8()
{
  return MEMORY[0x1F40F2418]();
}

uint64_t sub_1A8A759C8()
{
  return MEMORY[0x1F40F2428]();
}

uint64_t sub_1A8A759D8()
{
  return MEMORY[0x1F40F2430]();
}

uint64_t sub_1A8A759E8()
{
  return MEMORY[0x1F40F2440]();
}

uint64_t sub_1A8A759F8()
{
  return MEMORY[0x1F40F2448]();
}

uint64_t sub_1A8A75A08()
{
  return MEMORY[0x1F40F2450]();
}

uint64_t sub_1A8A75A18()
{
  return MEMORY[0x1F40F2458]();
}

uint64_t sub_1A8A75A28()
{
  return MEMORY[0x1F40F2460]();
}

uint64_t sub_1A8A75A38()
{
  return MEMORY[0x1F40F2468]();
}

uint64_t sub_1A8A75A48()
{
  return MEMORY[0x1F40F2470]();
}

uint64_t sub_1A8A75A58()
{
  return MEMORY[0x1F40F2500]();
}

uint64_t sub_1A8A75A68()
{
  return MEMORY[0x1F40F2508]();
}

uint64_t sub_1A8A75A78()
{
  return MEMORY[0x1F40F2510]();
}

uint64_t sub_1A8A75A88()
{
  return MEMORY[0x1F40F2520]();
}

uint64_t sub_1A8A75A98()
{
  return MEMORY[0x1F40F2528]();
}

uint64_t sub_1A8A75AA8()
{
  return MEMORY[0x1F40F2530]();
}

uint64_t sub_1A8A75AB8()
{
  return MEMORY[0x1F40F2538]();
}

uint64_t sub_1A8A75AC8()
{
  return MEMORY[0x1F40F2540]();
}

uint64_t sub_1A8A75AD8()
{
  return MEMORY[0x1F40F2548]();
}

uint64_t sub_1A8A75AE8()
{
  return MEMORY[0x1F40F2550]();
}

uint64_t sub_1A8A75AF8()
{
  return MEMORY[0x1F40F2558]();
}

uint64_t sub_1A8A75B08()
{
  return MEMORY[0x1F40F2560]();
}

uint64_t sub_1A8A75B18()
{
  return MEMORY[0x1F40F2568]();
}

uint64_t sub_1A8A75B28()
{
  return MEMORY[0x1F40F2570]();
}

uint64_t sub_1A8A75B38()
{
  return MEMORY[0x1F40F2578]();
}

uint64_t sub_1A8A75B48()
{
  return MEMORY[0x1F40F2588]();
}

uint64_t sub_1A8A75B58()
{
  return MEMORY[0x1F40F2590]();
}

uint64_t sub_1A8A75B68()
{
  return MEMORY[0x1F40F2598]();
}

uint64_t sub_1A8A75B78()
{
  return MEMORY[0x1F40F25A0]();
}

uint64_t sub_1A8A75B88()
{
  return MEMORY[0x1F40F25A8]();
}

uint64_t sub_1A8A75B98()
{
  return MEMORY[0x1F40F25B0]();
}

uint64_t sub_1A8A75BA8()
{
  return MEMORY[0x1F40F25B8]();
}

uint64_t sub_1A8A75BB8()
{
  return MEMORY[0x1F40F2660]();
}

uint64_t sub_1A8A75BC8()
{
  return MEMORY[0x1F40F26A0]();
}

uint64_t sub_1A8A75BD8()
{
  return MEMORY[0x1F40F26A8]();
}

uint64_t sub_1A8A75BE8()
{
  return MEMORY[0x1F40F26B0]();
}

uint64_t sub_1A8A75BF8()
{
  return MEMORY[0x1F40F26F0]();
}

uint64_t sub_1A8A75C08()
{
  return MEMORY[0x1F40F2718]();
}

uint64_t sub_1A8A75C18()
{
  return MEMORY[0x1F40F2720]();
}

uint64_t sub_1A8A75C28()
{
  return MEMORY[0x1F40F2728]();
}

uint64_t sub_1A8A75C38()
{
  return MEMORY[0x1F40F2730]();
}

uint64_t sub_1A8A75C48()
{
  return MEMORY[0x1F4186C40]();
}

uint64_t sub_1A8A75C58()
{
  return MEMORY[0x1F4186C58]();
}

uint64_t sub_1A8A75C68()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1A8A75C78()
{
  return MEMORY[0x1F4186C78]();
}

uint64_t sub_1A8A75C88()
{
  return MEMORY[0x1F4186CA8]();
}

uint64_t sub_1A8A75C98()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1A8A75CA8()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1A8A75CB8()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1A8A75CC8()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1A8A75CD8()
{
  return MEMORY[0x1F4186D40]();
}

uint64_t sub_1A8A75CE8()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1A8A75CF8()
{
  return MEMORY[0x1F40E5FB0]();
}

uint64_t sub_1A8A75D08()
{
  return MEMORY[0x1F40E5FB8]();
}

uint64_t sub_1A8A75D18()
{
  return MEMORY[0x1F40E5FC0]();
}

uint64_t sub_1A8A75D28()
{
  return MEMORY[0x1F40E5FC8]();
}

uint64_t sub_1A8A75D38()
{
  return MEMORY[0x1F40E5FD0]();
}

uint64_t sub_1A8A75D48()
{
  return MEMORY[0x1F4186D70]();
}

uint64_t sub_1A8A75D58()
{
  return MEMORY[0x1F4186D78]();
}

uint64_t sub_1A8A75D68()
{
  return MEMORY[0x1F4186D80]();
}

uint64_t sub_1A8A75D78()
{
  return MEMORY[0x1F4186D88]();
}

uint64_t sub_1A8A75D88()
{
  return MEMORY[0x1F4186D90]();
}

uint64_t sub_1A8A75D98()
{
  return MEMORY[0x1F4186D98]();
}

uint64_t sub_1A8A75DA8()
{
  return MEMORY[0x1F4186DA0]();
}

uint64_t sub_1A8A75DB8()
{
  return MEMORY[0x1F4186DA8]();
}

uint64_t _s13IMAP2Protocol11MessageDataV04BodyD0V5countSivg_0()
{
  return MEMORY[0x1F4186DB8]();
}

uint64_t sub_1A8A75DD8()
{
  return MEMORY[0x1F4186DC0]();
}

uint64_t sub_1A8A75DE8()
{
  return MEMORY[0x1F4186DC8]();
}

uint64_t sub_1A8A75DF8()
{
  return MEMORY[0x1F4186DD8]();
}

uint64_t sub_1A8A75E08()
{
  return MEMORY[0x1F4186DE0]();
}

uint64_t sub_1A8A75E18()
{
  return MEMORY[0x1F4186DE8]();
}

uint64_t sub_1A8A75E28()
{
  return MEMORY[0x1F4186DF0]();
}

uint64_t sub_1A8A75E38()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1A8A75E48()
{
  return MEMORY[0x1F4186E38]();
}

uint64_t sub_1A8A75E58()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1A8A75E68()
{
  return MEMORY[0x1F4186E70]();
}

uint64_t sub_1A8A75E78()
{
  return MEMORY[0x1F4186E80]();
}

uint64_t sub_1A8A75E88()
{
  return MEMORY[0x1F4186E98]();
}

uint64_t sub_1A8A75E98()
{
  return MEMORY[0x1F4186EA0]();
}

uint64_t sub_1A8A75EA8()
{
  return MEMORY[0x1F4186EC0]();
}

uint64_t sub_1A8A75EB8()
{
  return MEMORY[0x1F4186EE8]();
}

uint64_t sub_1A8A75EC8()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1A8A75ED8()
{
  return MEMORY[0x1F4186F20]();
}

uint64_t sub_1A8A75EE8()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1A8A75EF8()
{
  return MEMORY[0x1F40DFF38]();
}

uint64_t sub_1A8A75F08()
{
  return MEMORY[0x1F40DFF40]();
}

uint64_t sub_1A8A75F18()
{
  return MEMORY[0x1F40DFF50]();
}

uint64_t sub_1A8A75F28()
{
  return MEMORY[0x1F40DFF58]();
}

uint64_t sub_1A8A75F38()
{
  return MEMORY[0x1F40DFF88]();
}

uint64_t sub_1A8A75F48()
{
  return MEMORY[0x1F40DFF90]();
}

uint64_t sub_1A8A75F58()
{
  return MEMORY[0x1F40DFFC0]();
}

uint64_t sub_1A8A75F68()
{
  return MEMORY[0x1F40DFFD8]();
}

uint64_t sub_1A8A75F78()
{
  return MEMORY[0x1F40E0100]();
}

uint64_t sub_1A8A75F88()
{
  return MEMORY[0x1F40E04B8]();
}

uint64_t sub_1A8A75F98()
{
  return MEMORY[0x1F40E04C0]();
}

uint64_t sub_1A8A75FA8()
{
  return MEMORY[0x1F40E04C8]();
}

uint64_t sub_1A8A75FB8()
{
  return MEMORY[0x1F40E04D0]();
}

uint64_t sub_1A8A75FC8()
{
  return MEMORY[0x1F40E0540]();
}

uint64_t sub_1A8A75FD8()
{
  return MEMORY[0x1F40E0550]();
}

uint64_t sub_1A8A75FE8()
{
  return MEMORY[0x1F4183288]();
}

uint64_t sub_1A8A75FF8()
{
  return MEMORY[0x1F40E5FE0]();
}

uint64_t sub_1A8A76008()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1A8A76018()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1A8A76028()
{
  return MEMORY[0x1F4183320]();
}

uint64_t sub_1A8A76038()
{
  return MEMORY[0x1F4183330]();
}

uint64_t sub_1A8A76048()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1A8A76058()
{
  return MEMORY[0x1F4183360]();
}

uint64_t sub_1A8A76068()
{
  return MEMORY[0x1F4183378]();
}

uint64_t sub_1A8A76078()
{
  return MEMORY[0x1F4183388]();
}

uint64_t _s13IMAP2Behavior27ConnectionIDsGroupedByStateV11connectionsSayAC0C0VGvg_0()
{
  return MEMORY[0x1F41833A0]();
}

uint64_t sub_1A8A76098()
{
  return MEMORY[0x1F41833D0]();
}

uint64_t sub_1A8A760A8()
{
  return MEMORY[0x1F41833E0]();
}

uint64_t sub_1A8A760B8()
{
  return MEMORY[0x1F41833F8]();
}

uint64_t sub_1A8A760C8()
{
  return MEMORY[0x1F4183400]();
}

uint64_t sub_1A8A760D8()
{
  return MEMORY[0x1F4183410]();
}

uint64_t sub_1A8A760E8()
{
  return MEMORY[0x1F4183418]();
}

uint64_t sub_1A8A760F8()
{
  return MEMORY[0x1F4183420]();
}

uint64_t sub_1A8A76108()
{
  return MEMORY[0x1F4183428]();
}

uint64_t sub_1A8A76118()
{
  return MEMORY[0x1F4183430]();
}

uint64_t sub_1A8A76128()
{
  return MEMORY[0x1F4183438]();
}

uint64_t sub_1A8A76138()
{
  return MEMORY[0x1F4183440]();
}

uint64_t sub_1A8A76148()
{
  return MEMORY[0x1F4183450]();
}

uint64_t sub_1A8A76158()
{
  return MEMORY[0x1F4183498]();
}

uint64_t sub_1A8A76168()
{
  return MEMORY[0x1F41834A0]();
}

uint64_t sub_1A8A76178()
{
  return MEMORY[0x1F41834B0]();
}

uint64_t sub_1A8A76188()
{
  return MEMORY[0x1F41834B8]();
}

uint64_t sub_1A8A76198()
{
  return MEMORY[0x1F41834C0]();
}

uint64_t sub_1A8A761A8()
{
  return MEMORY[0x1F41834D0]();
}

uint64_t sub_1A8A761B8()
{
  return MEMORY[0x1F41834E0]();
}

uint64_t sub_1A8A761C8()
{
  return MEMORY[0x1F41834F0]();
}

uint64_t sub_1A8A761D8()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1A8A761E8()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1A8A761F8()
{
  return MEMORY[0x1F4183508]();
}

uint64_t sub_1A8A76208()
{
  return MEMORY[0x1F41835B0]();
}

uint64_t sub_1A8A76218()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1A8A76228()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1A8A76238()
{
  return MEMORY[0x1F41835D8]();
}

uint64_t sub_1A8A76248()
{
  return MEMORY[0x1F41835F8]();
}

uint64_t sub_1A8A76258()
{
  return MEMORY[0x1F4183608]();
}

uint64_t sub_1A8A76268()
{
  return MEMORY[0x1F4183630]();
}

uint64_t sub_1A8A76278()
{
  return MEMORY[0x1F4183658]();
}

uint64_t sub_1A8A76288()
{
  return MEMORY[0x1F4183668]();
}

uint64_t sub_1A8A76298()
{
  return MEMORY[0x1F4183670]();
}

uint64_t sub_1A8A762A8()
{
  return MEMORY[0x1F4183678]();
}

uint64_t sub_1A8A762B8()
{
  return MEMORY[0x1F4183680]();
}

uint64_t sub_1A8A762C8()
{
  return MEMORY[0x1F41836A0]();
}

uint64_t sub_1A8A762D8()
{
  return MEMORY[0x1F41836A8]();
}

uint64_t sub_1A8A762E8()
{
  return MEMORY[0x1F41836E0]();
}

uint64_t sub_1A8A762F8()
{
  return MEMORY[0x1F41836E8]();
}

uint64_t sub_1A8A76308()
{
  return MEMORY[0x1F41836F8]();
}

uint64_t sub_1A8A76318()
{
  return MEMORY[0x1F4183708]();
}

uint64_t sub_1A8A76328()
{
  return MEMORY[0x1F4183710]();
}

uint64_t sub_1A8A76338()
{
  return MEMORY[0x1F4183728]();
}

uint64_t sub_1A8A76348()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1A8A76358()
{
  return MEMORY[0x1F4183738]();
}

uint64_t sub_1A8A76368()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1A8A76378()
{
  return MEMORY[0x1F4183748]();
}

uint64_t sub_1A8A76388()
{
  return MEMORY[0x1F4183750]();
}

uint64_t sub_1A8A76398()
{
  return MEMORY[0x1F4183758]();
}

uint64_t sub_1A8A763A8()
{
  return MEMORY[0x1F4183760]();
}

uint64_t sub_1A8A763B8()
{
  return MEMORY[0x1F4183768]();
}

uint64_t sub_1A8A763C8()
{
  return MEMORY[0x1F4183788]();
}

uint64_t sub_1A8A763D8()
{
  return MEMORY[0x1F4183790]();
}

uint64_t sub_1A8A763E8()
{
  return MEMORY[0x1F4183798]();
}

uint64_t sub_1A8A763F8()
{
  return MEMORY[0x1F41837A8]();
}

uint64_t sub_1A8A76408()
{
  return MEMORY[0x1F41837B0]();
}

uint64_t sub_1A8A76418()
{
  return MEMORY[0x1F41837C0]();
}

uint64_t sub_1A8A76428()
{
  return MEMORY[0x1F41837C8]();
}

uint64_t sub_1A8A76438()
{
  return MEMORY[0x1F41837D8]();
}

uint64_t sub_1A8A76468()
{
  return MEMORY[0x1F4183800]();
}

uint64_t sub_1A8A76478()
{
  return MEMORY[0x1F4183808]();
}

uint64_t sub_1A8A76488()
{
  return MEMORY[0x1F4183810]();
}

uint64_t sub_1A8A76498()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1A8A764A8()
{
  return MEMORY[0x1F4183848]();
}

uint64_t sub_1A8A764B8()
{
  return MEMORY[0x1F4183850]();
}

uint64_t sub_1A8A764C8()
{
  return MEMORY[0x1F4183860]();
}

uint64_t sub_1A8A764D8()
{
  return MEMORY[0x1F40E60F0]();
}

uint64_t sub_1A8A764E8()
{
  return MEMORY[0x1F40E6110]();
}

uint64_t sub_1A8A764F8()
{
  return MEMORY[0x1F40E6128]();
}

uint64_t sub_1A8A76508()
{
  return MEMORY[0x1F40E6130]();
}

uint64_t sub_1A8A76518()
{
  return MEMORY[0x1F40E6148]();
}

uint64_t sub_1A8A76528()
{
  return MEMORY[0x1F40E6158]();
}

uint64_t sub_1A8A76538()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1A8A76548()
{
  return MEMORY[0x1F40E61A0]();
}

uint64_t sub_1A8A76558()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1A8A76568()
{
  return MEMORY[0x1F40E61E8]();
}

uint64_t sub_1A8A76578()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1A8A76588()
{
  return MEMORY[0x1F40E6200]();
}

uint64_t sub_1A8A76598()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1A8A765A8()
{
  return MEMORY[0x1F40E6240]();
}

uint64_t sub_1A8A765B8()
{
  return MEMORY[0x1F40E6258]();
}

uint64_t sub_1A8A765C8()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1A8A765D8()
{
  return MEMORY[0x1F40E6278]();
}

uint64_t sub_1A8A765E8()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1A8A765F8()
{
  return MEMORY[0x1F40E62B0]();
}

uint64_t sub_1A8A76608()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1A8A76618()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1A8A76628()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_1A8A76638()
{
  return MEMORY[0x1F41838B0]();
}

uint64_t sub_1A8A76648()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1A8A76658()
{
  return MEMORY[0x1F41838D0]();
}

uint64_t sub_1A8A76668()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1A8A76678()
{
  return MEMORY[0x1F41838F0]();
}

uint64_t sub_1A8A76688()
{
  return MEMORY[0x1F4183908]();
}

uint64_t sub_1A8A76698()
{
  return MEMORY[0x1F4183920]();
}

uint64_t sub_1A8A766A8()
{
  return MEMORY[0x1F4183928]();
}

uint64_t sub_1A8A766B8()
{
  return MEMORY[0x1F4183930]();
}

uint64_t sub_1A8A766C8()
{
  return MEMORY[0x1F4183938]();
}

uint64_t sub_1A8A766D8()
{
  return MEMORY[0x1F4183940]();
}

uint64_t sub_1A8A766E8()
{
  return MEMORY[0x1F4183950]();
}

uint64_t sub_1A8A766F8()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1A8A76708()
{
  return MEMORY[0x1F4183968]();
}

uint64_t sub_1A8A76718()
{
  return MEMORY[0x1F4183970]();
}

uint64_t sub_1A8A76728()
{
  return MEMORY[0x1F4183978]();
}

uint64_t sub_1A8A76738()
{
  return MEMORY[0x1F4183988]();
}

uint64_t sub_1A8A76748()
{
  return MEMORY[0x1F4183990]();
}

uint64_t sub_1A8A76758()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1A8A76768()
{
  return MEMORY[0x1F41839B8]();
}

uint64_t sub_1A8A76778()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1A8A76788()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t sub_1A8A76798()
{
  return MEMORY[0x1F4183A00]();
}

uint64_t sub_1A8A767A8()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1A8A767B8()
{
  return MEMORY[0x1F4183A10]();
}

uint64_t sub_1A8A767C8()
{
  return MEMORY[0x1F4183A18]();
}

uint64_t sub_1A8A767D8()
{
  return MEMORY[0x1F4183A30]();
}

uint64_t sub_1A8A767E8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1A8A767F8()
{
  return MEMORY[0x1F4183A50]();
}

uint64_t sub_1A8A76808()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1A8A76818()
{
  return MEMORY[0x1F4183A68]();
}

uint64_t sub_1A8A76828()
{
  return MEMORY[0x1F4183A70]();
}

uint64_t sub_1A8A76838()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1A8A76848()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1A8A76858()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1A8A76868()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1A8A76878()
{
  return MEMORY[0x1F4183AA8]();
}

uint64_t sub_1A8A76888()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1A8A76898()
{
  return MEMORY[0x1F4183AC0]();
}

uint64_t sub_1A8A768A8()
{
  return MEMORY[0x1F4183AD0]();
}

uint64_t sub_1A8A768B8()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1A8A768C8()
{
  return MEMORY[0x1F4183B18]();
}

uint64_t sub_1A8A768D8()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1A8A768E8()
{
  return MEMORY[0x1F4183B38]();
}

uint64_t sub_1A8A768F8()
{
  return MEMORY[0x1F4183B40]();
}

uint64_t sub_1A8A76908()
{
  return MEMORY[0x1F4183B48]();
}

uint64_t sub_1A8A76918()
{
  return MEMORY[0x1F4183B50]();
}

uint64_t sub_1A8A76928()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1A8A76938()
{
  return MEMORY[0x1F4183B60]();
}

uint64_t sub_1A8A76948()
{
  return MEMORY[0x1F4183B80]();
}

uint64_t sub_1A8A76958()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1A8A76968()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1A8A76978()
{
  return MEMORY[0x1F40E6310]();
}

uint64_t sub_1A8A76988()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1A8A76998()
{
  return MEMORY[0x1F4183BB0]();
}

uint64_t sub_1A8A769A8()
{
  return MEMORY[0x1F4183BB8]();
}

uint64_t sub_1A8A769B8()
{
  return MEMORY[0x1F4183BD0]();
}

uint64_t sub_1A8A769C8()
{
  return MEMORY[0x1F4183BE0]();
}

uint64_t sub_1A8A769D8()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_1A8A769E8()
{
  return MEMORY[0x1F4183BF0]();
}

uint64_t sub_1A8A769F8()
{
  return MEMORY[0x1F4183BF8]();
}

uint64_t sub_1A8A76A08()
{
  return MEMORY[0x1F4183C18]();
}

uint64_t sub_1A8A76A18()
{
  return MEMORY[0x1F4183C20]();
}

uint64_t sub_1A8A76A28()
{
  return MEMORY[0x1F4183C38]();
}

uint64_t sub_1A8A76A38()
{
  return MEMORY[0x1F4183C40]();
}

uint64_t sub_1A8A76A48()
{
  return MEMORY[0x1F4183C48]();
}

uint64_t sub_1A8A76A58()
{
  return MEMORY[0x1F4183C60]();
}

uint64_t sub_1A8A76A68()
{
  return MEMORY[0x1F4183C68]();
}

uint64_t sub_1A8A76A78()
{
  return MEMORY[0x1F4183C70]();
}

uint64_t sub_1A8A76A88()
{
  return MEMORY[0x1F4183C78]();
}

uint64_t sub_1A8A76A98()
{
  return MEMORY[0x1F4183C80]();
}

uint64_t sub_1A8A76AA8()
{
  return MEMORY[0x1F4183C88]();
}

uint64_t sub_1A8A76AB8()
{
  return MEMORY[0x1F4183C90]();
}

uint64_t sub_1A8A76AC8()
{
  return MEMORY[0x1F4183CB0]();
}

uint64_t sub_1A8A76AD8()
{
  return MEMORY[0x1F4183CB8]();
}

uint64_t sub_1A8A76AE8()
{
  return MEMORY[0x1F4183CC0]();
}

uint64_t sub_1A8A76AF8()
{
  return MEMORY[0x1F4183CC8]();
}

uint64_t sub_1A8A76B08()
{
  return MEMORY[0x1F4183CD0]();
}

uint64_t sub_1A8A76B18()
{
  return MEMORY[0x1F4183CE0]();
}

uint64_t sub_1A8A76B28()
{
  return MEMORY[0x1F4183CF0]();
}

uint64_t sub_1A8A76B38()
{
  return MEMORY[0x1F4183CF8]();
}

uint64_t sub_1A8A76B48()
{
  return MEMORY[0x1F4183D00]();
}

uint64_t sub_1A8A76B58()
{
  return MEMORY[0x1F4183D10]();
}

uint64_t sub_1A8A76B68()
{
  return MEMORY[0x1F4183D18]();
}

uint64_t sub_1A8A76B78()
{
  return MEMORY[0x1F4183D28]();
}

uint64_t sub_1A8A76B88()
{
  return MEMORY[0x1F4183D30]();
}

uint64_t sub_1A8A76B98()
{
  return MEMORY[0x1F4183D38]();
}

uint64_t sub_1A8A76BA8()
{
  return MEMORY[0x1F4183D40]();
}

uint64_t sub_1A8A76BB8()
{
  return MEMORY[0x1F4183D50]();
}

uint64_t sub_1A8A76BC8()
{
  return MEMORY[0x1F4183D68]();
}

uint64_t sub_1A8A76BD8()
{
  return MEMORY[0x1F4183DD0]();
}

uint64_t sub_1A8A76BE8()
{
  return MEMORY[0x1F4183DE0]();
}

uint64_t sub_1A8A76BF8()
{
  return MEMORY[0x1F4183DE8]();
}

uint64_t sub_1A8A76C08()
{
  return MEMORY[0x1F4183DF0]();
}

uint64_t sub_1A8A76C18()
{
  return MEMORY[0x1F4183E48]();
}

uint64_t sub_1A8A76C28()
{
  return MEMORY[0x1F4183E68]();
}

uint64_t sub_1A8A76C38()
{
  return MEMORY[0x1F4183E70]();
}

uint64_t sub_1A8A76C48()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1A8A76C58()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1A8A76C68()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1A8A76C78()
{
  return MEMORY[0x1F4183E88]();
}

uint64_t sub_1A8A76C88()
{
  return MEMORY[0x1F41876E0]();
}

uint64_t sub_1A8A76C98()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1A8A76CA8()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1A8A76CB8()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1A8A76CC8()
{
  return MEMORY[0x1F4183EB8]();
}

uint64_t sub_1A8A76CD8()
{
  return MEMORY[0x1F4183EC0]();
}

uint64_t sub_1A8A76CE8()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1A8A76CF8()
{
  return MEMORY[0x1F4183ED8]();
}

uint64_t sub_1A8A76D08()
{
  return MEMORY[0x1F4183EE8]();
}

uint64_t sub_1A8A76D18()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1A8A76D28()
{
  return MEMORY[0x1F4183EF8]();
}

uint64_t sub_1A8A76D38()
{
  return MEMORY[0x1F4183F00]();
}

uint64_t sub_1A8A76D48()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1A8A76D58()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1A8A76D68()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1A8A76D78()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1A8A76D88()
{
  return MEMORY[0x1F41876E8]();
}

uint64_t sub_1A8A76D98()
{
  return MEMORY[0x1F41876F8]();
}

uint64_t sub_1A8A76DA8()
{
  return MEMORY[0x1F4183F48]();
}

uint64_t sub_1A8A76DB8()
{
  return MEMORY[0x1F4183F50]();
}

uint64_t sub_1A8A76DC8()
{
  return MEMORY[0x1F4183F58]();
}

uint64_t sub_1A8A76DD8()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1A8A76DE8()
{
  return MEMORY[0x1F4187700]();
}

uint64_t sub_1A8A76DF8()
{
  return MEMORY[0x1F4183F68]();
}

uint64_t sub_1A8A76E08()
{
  return MEMORY[0x1F4183F70]();
}

uint64_t sub_1A8A76E18()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1A8A76E28()
{
  return MEMORY[0x1F4187718]();
}

uint64_t sub_1A8A76E38()
{
  return MEMORY[0x1F4183F80]();
}

uint64_t sub_1A8A76E48()
{
  return MEMORY[0x1F4183F98]();
}

uint64_t sub_1A8A76E58()
{
  return MEMORY[0x1F4187730]();
}

uint64_t sub_1A8A76E68()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1A8A76E78()
{
  return MEMORY[0x1F4183FC8]();
}

uint64_t sub_1A8A76E88()
{
  return MEMORY[0x1F4183FD8]();
}

uint64_t sub_1A8A76E98()
{
  return MEMORY[0x1F4183FE0]();
}

uint64_t sub_1A8A76EA8()
{
  return MEMORY[0x1F4183FE8]();
}

uint64_t sub_1A8A76EB8()
{
  return MEMORY[0x1F4183FF0]();
}

uint64_t sub_1A8A76EC8()
{
  return MEMORY[0x1F4187738]();
}

uint64_t sub_1A8A76ED8()
{
  return MEMORY[0x1F40E6388]();
}

uint64_t sub_1A8A76EE8()
{
  return MEMORY[0x1F4184068]();
}

uint64_t sub_1A8A76EF8()
{
  return MEMORY[0x1F4184088]();
}

uint64_t sub_1A8A76F08()
{
  return MEMORY[0x1F41840D8]();
}

uint64_t sub_1A8A76F18()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1A8A76F28()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1A8A76F38()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1A8A76F48()
{
  return MEMORY[0x1F4184108]();
}

uint64_t sub_1A8A76F58()
{
  return MEMORY[0x1F4184110]();
}

uint64_t sub_1A8A76F68()
{
  return MEMORY[0x1F4184118]();
}

uint64_t sub_1A8A76F78()
{
  return MEMORY[0x1F4184130]();
}

uint64_t sub_1A8A76F88()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1A8A76F98()
{
  return MEMORY[0x1F4184150]();
}

uint64_t sub_1A8A76FA8()
{
  return MEMORY[0x1F4184160]();
}

uint64_t sub_1A8A76FB8()
{
  return MEMORY[0x1F4184170]();
}

uint64_t sub_1A8A76FC8()
{
  return MEMORY[0x1F4184178]();
}

uint64_t sub_1A8A76FD8()
{
  return MEMORY[0x1F4184188]();
}

uint64_t sub_1A8A76FE8()
{
  return MEMORY[0x1F4184198]();
}

uint64_t sub_1A8A76FF8()
{
  return MEMORY[0x1F41841A0]();
}

uint64_t sub_1A8A77008()
{
  return MEMORY[0x1F41841A8]();
}

uint64_t sub_1A8A77018()
{
  return MEMORY[0x1F41841B0]();
}

uint64_t sub_1A8A77028()
{
  return MEMORY[0x1F41841C0]();
}

uint64_t sub_1A8A77038()
{
  return MEMORY[0x1F41841C8]();
}

uint64_t sub_1A8A77048()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1A8A77058()
{
  return MEMORY[0x1F41841D8]();
}

uint64_t sub_1A8A77068()
{
  return MEMORY[0x1F41841F0]();
}

uint64_t sub_1A8A77078()
{
  return MEMORY[0x1F41841F8]();
}

uint64_t sub_1A8A77088()
{
  return MEMORY[0x1F4184200]();
}

uint64_t sub_1A8A77098()
{
  return MEMORY[0x1F4184208]();
}

uint64_t sub_1A8A770A8()
{
  return MEMORY[0x1F4184218]();
}

uint64_t sub_1A8A770B8()
{
  return MEMORY[0x1F4184228]();
}

uint64_t sub_1A8A770C8()
{
  return MEMORY[0x1F4184230]();
}

uint64_t sub_1A8A770D8()
{
  return MEMORY[0x1F4184250]();
}

uint64_t sub_1A8A770E8()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1A8A770F8()
{
  return MEMORY[0x1F4184260]();
}

uint64_t sub_1A8A77108()
{
  return MEMORY[0x1F4184268]();
}

uint64_t sub_1A8A77118()
{
  return MEMORY[0x1F4184290]();
}

uint64_t sub_1A8A77128()
{
  return MEMORY[0x1F4184298]();
}

uint64_t sub_1A8A77138()
{
  return MEMORY[0x1F41842A0]();
}

uint64_t sub_1A8A77158()
{
  return MEMORY[0x1F41842B0]();
}

uint64_t sub_1A8A77198()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1A8A771A8()
{
  return MEMORY[0x1F41842D8]();
}

uint64_t sub_1A8A771B8()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1A8A771C8()
{
  return MEMORY[0x1F4184300]();
}

uint64_t sub_1A8A771D8()
{
  return MEMORY[0x1F4184320]();
}

uint64_t sub_1A8A771E8()
{
  return MEMORY[0x1F4184330]();
}

uint64_t sub_1A8A771F8()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1A8A77208()
{
  return MEMORY[0x1F4184340]();
}

uint64_t sub_1A8A77218()
{
  return MEMORY[0x1F4184348]();
}

uint64_t sub_1A8A77238()
{
  return MEMORY[0x1F4184368]();
}

uint64_t sub_1A8A77248()
{
  return MEMORY[0x1F4184370]();
}

uint64_t sub_1A8A77258()
{
  return MEMORY[0x1F4184378]();
}

uint64_t sub_1A8A77278()
{
  return MEMORY[0x1F4184390]();
}

uint64_t sub_1A8A77288()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1A8A77298()
{
  return MEMORY[0x1F41843C0]();
}

uint64_t sub_1A8A772A8()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1A8A772B8()
{
  return MEMORY[0x1F41843E0]();
}

uint64_t sub_1A8A772C8()
{
  return MEMORY[0x1F41843E8]();
}

uint64_t sub_1A8A772D8()
{
  return MEMORY[0x1F4184408]();
}

uint64_t sub_1A8A772E8()
{
  return MEMORY[0x1F4184410]();
}

uint64_t sub_1A8A772F8()
{
  return MEMORY[0x1F4184428]();
}

uint64_t sub_1A8A77308()
{
  return MEMORY[0x1F4187748]();
}

uint64_t sub_1A8A77318()
{
  return MEMORY[0x1F4184430]();
}

uint64_t sub_1A8A77328()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1A8A77338()
{
  return MEMORY[0x1F4184490]();
}

uint64_t sub_1A8A77348()
{
  return MEMORY[0x1F41844A8]();
}

uint64_t sub_1A8A77368()
{
  return MEMORY[0x1F4184508]();
}

uint64_t sub_1A8A77388()
{
  return MEMORY[0x1F4184518]();
}

uint64_t sub_1A8A77398()
{
  return MEMORY[0x1F4184540]();
}

uint64_t sub_1A8A773A8()
{
  return MEMORY[0x1F4184548]();
}

uint64_t sub_1A8A773B8()
{
  return MEMORY[0x1F4184550]();
}

uint64_t sub_1A8A773E8()
{
  return MEMORY[0x1F4184568]();
}

uint64_t sub_1A8A773F8()
{
  return MEMORY[0x1F4184580]();
}

uint64_t sub_1A8A77408()
{
  return MEMORY[0x1F4184598]();
}

uint64_t sub_1A8A77418()
{
  return MEMORY[0x1F41845B0]();
}

uint64_t sub_1A8A77428()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1A8A77438()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1A8A77448()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1A8A77458()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1A8A77468()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1A8A77478()
{
  return MEMORY[0x1F4186F80]();
}

uint64_t sub_1A8A77488()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1A8A77498()
{
  return MEMORY[0x1F4186FE8]();
}

uint64_t sub_1A8A774A8()
{
  return MEMORY[0x1F4187020]();
}

uint64_t sub_1A8A774B8()
{
  return MEMORY[0x1F4187028]();
}

uint64_t sub_1A8A774C8()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1A8A774D8()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_1A8A774E8()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1A8A774F8()
{
  return MEMORY[0x1F41870F0]();
}

uint64_t sub_1A8A77508()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1A8A77518()
{
  return MEMORY[0x1F4187108]();
}

uint64_t sub_1A8A77528()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1A8A77538()
{
  return MEMORY[0x1F4187130]();
}

uint64_t sub_1A8A77548()
{
  return MEMORY[0x1F4187168]();
}

uint64_t sub_1A8A77558()
{
  return MEMORY[0x1F41871D0]();
}

uint64_t sub_1A8A77568()
{
  return MEMORY[0x1F41871E0]();
}

uint64_t sub_1A8A77578()
{
  return MEMORY[0x1F41871F0]();
}

uint64_t sub_1A8A77588()
{
  return MEMORY[0x1F4187200]();
}

uint64_t sub_1A8A77598()
{
  return MEMORY[0x1F4187218]();
}

uint64_t sub_1A8A775A8()
{
  return MEMORY[0x1F4187230]();
}

uint64_t sub_1A8A775B8()
{
  return MEMORY[0x1F4187240]();
}

uint64_t sub_1A8A775C8()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1A8A775D8()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1A8A775E8()
{
  return MEMORY[0x1F4188718]();
}

uint64_t sub_1A8A775F8()
{
  return MEMORY[0x1F4117900]();
}

uint64_t sub_1A8A77608()
{
  return MEMORY[0x1F4117908]();
}

uint64_t sub_1A8A77618()
{
  return MEMORY[0x1F4117910]();
}

uint64_t sub_1A8A77628()
{
  return MEMORY[0x1F4117918]();
}

uint64_t sub_1A8A77638()
{
  return MEMORY[0x1F4117920]();
}

uint64_t sub_1A8A77648()
{
  return MEMORY[0x1F4117928]();
}

uint64_t sub_1A8A77658()
{
  return MEMORY[0x1F4117930]();
}

uint64_t sub_1A8A77668()
{
  return MEMORY[0x1F4117938]();
}

uint64_t sub_1A8A77678()
{
  return MEMORY[0x1F4117940]();
}

uint64_t sub_1A8A77688()
{
  return MEMORY[0x1F4117948]();
}

uint64_t sub_1A8A77698()
{
  return MEMORY[0x1F4117950]();
}

uint64_t sub_1A8A776A8()
{
  return MEMORY[0x1F4117958]();
}

uint64_t sub_1A8A776B8()
{
  return MEMORY[0x1F4117960]();
}

uint64_t sub_1A8A776C8()
{
  return MEMORY[0x1F4117968]();
}

uint64_t sub_1A8A776D8()
{
  return MEMORY[0x1F4117970]();
}

uint64_t sub_1A8A776E8()
{
  return MEMORY[0x1F4117978]();
}

uint64_t sub_1A8A776F8()
{
  return MEMORY[0x1F4117980]();
}

uint64_t sub_1A8A77708()
{
  return MEMORY[0x1F4117988]();
}

uint64_t sub_1A8A77718()
{
  return MEMORY[0x1F4187250]();
}

uint64_t sub_1A8A77728()
{
  return MEMORY[0x1F4187258]();
}

uint64_t sub_1A8A77738()
{
  return MEMORY[0x1F4117990]();
}

uint64_t sub_1A8A77748()
{
  return MEMORY[0x1F4117998]();
}

uint64_t sub_1A8A77758()
{
  return MEMORY[0x1F4187268]();
}

uint64_t sub_1A8A77768()
{
  return MEMORY[0x1F4187288]();
}

uint64_t sub_1A8A77778()
{
  return MEMORY[0x1F4117848]();
}

uint64_t sub_1A8A77788()
{
  return MEMORY[0x1F41872D0]();
}

uint64_t sub_1A8A77798()
{
  return MEMORY[0x1F41179A0]();
}

uint64_t sub_1A8A777A8()
{
  return MEMORY[0x1F41179A8]();
}

uint64_t sub_1A8A777B8()
{
  return MEMORY[0x1F40E6858]();
}

uint64_t sub_1A8A777C8()
{
  return MEMORY[0x1F40E68E0]();
}

uint64_t sub_1A8A777D8()
{
  return MEMORY[0x1F40E6910]();
}

uint64_t sub_1A8A777E8()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1A8A777F8()
{
  return MEMORY[0x1F40E6928]();
}

uint64_t sub_1A8A77808()
{
  return MEMORY[0x1F40E6988]();
}

uint64_t sub_1A8A77818()
{
  return MEMORY[0x1F40E6B20]();
}

uint64_t sub_1A8A77828()
{
  return MEMORY[0x1F40E6B30]();
}

uint64_t sub_1A8A77838()
{
  return MEMORY[0x1F40E6B38]();
}

uint64_t sub_1A8A77848()
{
  return MEMORY[0x1F4188720]();
}

uint64_t sub_1A8A77858()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1A8A77868()
{
  return MEMORY[0x1F41845D8]();
}

uint64_t sub_1A8A77878()
{
  return MEMORY[0x1F41845F8]();
}

uint64_t sub_1A8A77888()
{
  return MEMORY[0x1F4184618]();
}

uint64_t sub_1A8A77898()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1A8A778A8()
{
  return MEMORY[0x1F4184670]();
}

uint64_t sub_1A8A778B8()
{
  return MEMORY[0x1F4184678]();
}

uint64_t sub_1A8A778C8()
{
  return MEMORY[0x1F4184680]();
}

uint64_t sub_1A8A778D8()
{
  return MEMORY[0x1F41846E0]();
}

uint64_t sub_1A8A778E8()
{
  return MEMORY[0x1F4184720]();
}

uint64_t sub_1A8A778F8()
{
  return MEMORY[0x1F4184728]();
}

uint64_t sub_1A8A77908()
{
  return MEMORY[0x1F4184730]();
}

uint64_t sub_1A8A77918()
{
  return MEMORY[0x1F4184768]();
}

uint64_t sub_1A8A77928()
{
  return MEMORY[0x1F4184780]();
}

uint64_t sub_1A8A77938()
{
  return MEMORY[0x1F4184790]();
}

uint64_t sub_1A8A77948()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1A8A77958()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1A8A77968()
{
  return MEMORY[0x1F41847C8]();
}

uint64_t sub_1A8A77978()
{
  return MEMORY[0x1F41847E0]();
}

uint64_t sub_1A8A77988()
{
  return MEMORY[0x1F41847E8]();
}

uint64_t sub_1A8A77998()
{
  return MEMORY[0x1F41847F8]();
}

uint64_t sub_1A8A779A8()
{
  return MEMORY[0x1F4184810]();
}

uint64_t sub_1A8A779B8()
{
  return MEMORY[0x1F4184818]();
}

uint64_t sub_1A8A779C8()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1A8A779D8()
{
  return MEMORY[0x1F4184830]();
}

uint64_t sub_1A8A779E8()
{
  return MEMORY[0x1F4184840]();
}

uint64_t sub_1A8A779F8()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1A8A77A08()
{
  return MEMORY[0x1F40E6C30]();
}

uint64_t sub_1A8A77A18()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1A8A77A28()
{
  return MEMORY[0x1F40E6C98]();
}

uint64_t sub_1A8A77A38()
{
  return MEMORY[0x1F40E6D08]();
}

uint64_t sub_1A8A77A48()
{
  return MEMORY[0x1F40E6D38]();
}

uint64_t sub_1A8A77A58()
{
  return MEMORY[0x1F40E6D58]();
}

uint64_t sub_1A8A77A68()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1A8A77A78()
{
  return MEMORY[0x1F41876A8]();
}

uint64_t sub_1A8A77A88()
{
  return MEMORY[0x1F40E6DA0]();
}

uint64_t sub_1A8A77AA8()
{
  return MEMORY[0x1F41848C8]();
}

uint64_t sub_1A8A77AB8()
{
  return MEMORY[0x1F41848D0]();
}

uint64_t sub_1A8A77AC8()
{
  return MEMORY[0x1F4184908]();
}

uint64_t sub_1A8A77AD8()
{
  return MEMORY[0x1F4184910]();
}

uint64_t sub_1A8A77AE8()
{
  return MEMORY[0x1F4184938]();
}

uint64_t sub_1A8A77AF8()
{
  return MEMORY[0x1F4184940]();
}

uint64_t sub_1A8A77B18()
{
  return MEMORY[0x1F4184958]();
}

uint64_t sub_1A8A77B28()
{
  return MEMORY[0x1F4184970]();
}

uint64_t sub_1A8A77B38()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1A8A77B48()
{
  return MEMORY[0x1F4184A40]();
}

uint64_t sub_1A8A77B58()
{
  return MEMORY[0x1F4184A88]();
}

uint64_t sub_1A8A77B68()
{
  return MEMORY[0x1F4184A90]();
}

uint64_t sub_1A8A77B78()
{
  return MEMORY[0x1F4184AD0]();
}

uint64_t sub_1A8A77B88()
{
  return MEMORY[0x1F4184AD8]();
}

uint64_t sub_1A8A77B98()
{
  return MEMORY[0x1F4184AE0]();
}

uint64_t sub_1A8A77BA8()
{
  return MEMORY[0x1F4184AE8]();
}

uint64_t sub_1A8A77BB8()
{
  return MEMORY[0x1F4184AF0]();
}

uint64_t sub_1A8A77BC8()
{
  return MEMORY[0x1F4184AF8]();
}

uint64_t sub_1A8A77BD8()
{
  return MEMORY[0x1F4184B00]();
}

uint64_t sub_1A8A77BE8()
{
  return MEMORY[0x1F4184B08]();
}

uint64_t sub_1A8A77BF8()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1A8A77C08()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1A8A77C18()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1A8A77C28()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1A8A77C38()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1A8A77C48()
{
  return MEMORY[0x1F4184B68]();
}

uint64_t sub_1A8A77C58()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1A8A77C68()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1A8A77C78()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1A8A77C88()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1A8A77C98()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1A8A77CA8()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1A8A77CB8()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1A8A77CC8()
{
  return MEMORY[0x1F4184BD8]();
}

uint64_t sub_1A8A77CD8()
{
  return MEMORY[0x1F4184BE0]();
}

uint64_t sub_1A8A77CE8()
{
  return MEMORY[0x1F4184BE8]();
}

uint64_t sub_1A8A77CF8()
{
  return MEMORY[0x1F4184C10]();
}

uint64_t sub_1A8A77D08()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1A8A77D18()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1A8A77D28()
{
  return MEMORY[0x1F4184C30]();
}

uint64_t sub_1A8A77D38()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1A8A77D48()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1A8A77D58()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1A8A77D68()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1A8A77D78()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1A8A77D88()
{
  return MEMORY[0x1F4184CB0]();
}

uint64_t sub_1A8A77D98()
{
  return MEMORY[0x1F4184CC0]();
}

uint64_t sub_1A8A77DB8()
{
  return MEMORY[0x1F4184CE0]();
}

uint64_t sub_1A8A77DC8()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1A8A77DD8()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1A8A77DE8()
{
  return MEMORY[0x1F4184D18]();
}

uint64_t sub_1A8A77DF8()
{
  return MEMORY[0x1F4184D20]();
}

uint64_t sub_1A8A77E08()
{
  return MEMORY[0x1F4184D40]();
}

uint64_t sub_1A8A77E18()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1A8A77E28()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1A8A77E38()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1A8A77E48()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1A8A77E58()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1A8A77E68()
{
  return MEMORY[0x1F4184E28]();
}

uint64_t sub_1A8A77E78()
{
  return MEMORY[0x1F4184E38]();
}

uint64_t sub_1A8A77E88()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1A8A77E98()
{
  return MEMORY[0x1F4184E70]();
}

uint64_t sub_1A8A77EA8()
{
  return MEMORY[0x1F4184E80]();
}

uint64_t sub_1A8A77EB8()
{
  return MEMORY[0x1F4184EA8]();
}

uint64_t sub_1A8A77EC8()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1A8A77ED8()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1A8A77EE8()
{
  return MEMORY[0x1F4184EE0]();
}

uint64_t sub_1A8A77EF8()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1A8A77F08()
{
  return MEMORY[0x1F4184F08]();
}

uint64_t sub_1A8A77F18()
{
  return MEMORY[0x1F4184F20]();
}

uint64_t sub_1A8A77F28()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1A8A77F38()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1A8A77F48()
{
  return MEMORY[0x1F4184F38]();
}

uint64_t sub_1A8A77F58()
{
  return MEMORY[0x1F4184F40]();
}

uint64_t sub_1A8A77F68()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1A8A77F78()
{
  return MEMORY[0x1F4184F58]();
}

uint64_t sub_1A8A77F88()
{
  return MEMORY[0x1F4184F60]();
}

uint64_t sub_1A8A77F98()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1A8A77FA8()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1A8A77FB8()
{
  return MEMORY[0x1F4184F80]();
}

uint64_t sub_1A8A77FC8()
{
  return MEMORY[0x1F4184F88]();
}

uint64_t sub_1A8A77FD8()
{
  return MEMORY[0x1F4184FA8]();
}

uint64_t sub_1A8A77FE8()
{
  return MEMORY[0x1F4184FB0]();
}

uint64_t sub_1A8A77FF8()
{
  return MEMORY[0x1F4184FC0]();
}

uint64_t sub_1A8A78008()
{
  return MEMORY[0x1F4184FD8]();
}

uint64_t sub_1A8A78018()
{
  return MEMORY[0x1F4185048]();
}

uint64_t sub_1A8A78028()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1A8A78038()
{
  return MEMORY[0x1F4185060]();
}

uint64_t sub_1A8A78048()
{
  return MEMORY[0x1F4187758]();
}

uint64_t sub_1A8A78058()
{
  return MEMORY[0x1F4185068]();
}

uint64_t sub_1A8A78068()
{
  return MEMORY[0x1F4185070]();
}

uint64_t sub_1A8A78078()
{
  return MEMORY[0x1F41850E0]();
}

uint64_t sub_1A8A78088()
{
  return MEMORY[0x1F41850E8]();
}

uint64_t sub_1A8A78098()
{
  return MEMORY[0x1F41850F8]();
}

uint64_t sub_1A8A780A8()
{
  return MEMORY[0x1F4185118]();
}

uint64_t sub_1A8A780B8()
{
  return MEMORY[0x1F4185128]();
}

uint64_t sub_1A8A780C8()
{
  return MEMORY[0x1F4185140]();
}

uint64_t sub_1A8A780D8()
{
  return MEMORY[0x1F4185170]();
}

uint64_t sub_1A8A780E8()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1A8A780F8()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1A8A78108()
{
  return MEMORY[0x1F41852A8]();
}

uint64_t sub_1A8A78118()
{
  return MEMORY[0x1F41852B8]();
}

uint64_t sub_1A8A78128()
{
  return MEMORY[0x1F41852C8]();
}

uint64_t sub_1A8A78138()
{
  return MEMORY[0x1F41852E8]();
}

uint64_t sub_1A8A78148()
{
  return MEMORY[0x1F41852F0]();
}

uint64_t sub_1A8A78158()
{
  return MEMORY[0x1F41852F8]();
}

uint64_t sub_1A8A78168()
{
  return MEMORY[0x1F4185300]();
}

uint64_t sub_1A8A78178()
{
  return MEMORY[0x1F4185308]();
}

uint64_t sub_1A8A78188()
{
  return MEMORY[0x1F4185318]();
}

uint64_t sub_1A8A78198()
{
  return MEMORY[0x1F4185338]();
}

uint64_t sub_1A8A781A8()
{
  return MEMORY[0x1F4185340]();
}

uint64_t sub_1A8A781B8()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1A8A781C8()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1A8A781D8()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1A8A781E8()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1A8A781F8()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1A8A78208()
{
  return MEMORY[0x1F41853A0]();
}

uint64_t sub_1A8A78218()
{
  return MEMORY[0x1F41853A8]();
}

uint64_t sub_1A8A78228()
{
  return MEMORY[0x1F4185408]();
}

uint64_t sub_1A8A78238()
{
  return MEMORY[0x1F4185410]();
}

uint64_t sub_1A8A78248()
{
  return MEMORY[0x1F4185418]();
}

uint64_t sub_1A8A78258()
{
  return MEMORY[0x1F4185420]();
}

uint64_t sub_1A8A78268()
{
  return MEMORY[0x1F4185440]();
}

uint64_t sub_1A8A78278()
{
  return MEMORY[0x1F4185448]();
}

uint64_t sub_1A8A78288()
{
  return MEMORY[0x1F4185450]();
}

uint64_t sub_1A8A78298()
{
  return MEMORY[0x1F4185458]();
}

uint64_t sub_1A8A782A8()
{
  return MEMORY[0x1F4185460]();
}

uint64_t sub_1A8A782B8()
{
  return MEMORY[0x1F4185468]();
}

uint64_t sub_1A8A782C8()
{
  return MEMORY[0x1F4185470]();
}

uint64_t sub_1A8A782D8()
{
  return MEMORY[0x1F4185478]();
}

uint64_t sub_1A8A782E8()
{
  return MEMORY[0x1F41854C0]();
}

uint64_t sub_1A8A782F8()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1A8A78308()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1A8A78318()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1A8A78328()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1A8A78338()
{
  return MEMORY[0x1F4185520]();
}

uint64_t sub_1A8A78348()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1A8A78358()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1A8A78368()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1A8A78378()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1A8A78388()
{
  return MEMORY[0x1F41855B8]();
}

uint64_t sub_1A8A78398()
{
  return MEMORY[0x1F41855C8]();
}

uint64_t sub_1A8A783A8()
{
  return MEMORY[0x1F41855D0]();
}

uint64_t sub_1A8A783B8()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1A8A783C8()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1A8A783D8()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1A8A783E8()
{
  return MEMORY[0x1F4185630]();
}

uint64_t sub_1A8A783F8()
{
  return MEMORY[0x1F4185648]();
}

uint64_t sub_1A8A78408()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1A8A78418()
{
  return MEMORY[0x1F4185680]();
}

uint64_t sub_1A8A78428()
{
  return MEMORY[0x1F4185688]();
}

uint64_t sub_1A8A78438()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1A8A78448()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1A8A78458()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1A8A78468()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1A8A78478()
{
  return MEMORY[0x1F41856E0]();
}

uint64_t sub_1A8A78488()
{
  return MEMORY[0x1F41856F0]();
}

uint64_t sub_1A8A78498()
{
  return MEMORY[0x1F41856F8]();
}

uint64_t sub_1A8A784A8()
{
  return MEMORY[0x1F4185700]();
}

uint64_t sub_1A8A784B8()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1A8A784C8()
{
  return MEMORY[0x1F4185748]();
}

uint64_t sub_1A8A784D8()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1A8A784E8()
{
  return MEMORY[0x1F41858F8]();
}

uint64_t sub_1A8A784F8()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1A8A78508()
{
  return MEMORY[0x1F41859F0]();
}

uint64_t sub_1A8A78518()
{
  return MEMORY[0x1F41859F8]();
}

uint64_t sub_1A8A78528()
{
  return MEMORY[0x1F4185A00]();
}

uint64_t sub_1A8A78538()
{
  return MEMORY[0x1F4185A08]();
}

uint64_t sub_1A8A78548()
{
  return MEMORY[0x1F4185A20]();
}

uint64_t sub_1A8A78558()
{
  return MEMORY[0x1F4185A28]();
}

uint64_t sub_1A8A78568()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1A8A78578()
{
  return MEMORY[0x1F4185A38]();
}

uint64_t sub_1A8A78588()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1A8A78598()
{
  return MEMORY[0x1F4185A48]();
}

uint64_t sub_1A8A785A8()
{
  return MEMORY[0x1F4185A58]();
}

uint64_t sub_1A8A785B8()
{
  return MEMORY[0x1F4185A88]();
}

uint64_t sub_1A8A785C8()
{
  return MEMORY[0x1F4185AF0]();
}

uint64_t sub_1A8A785D8()
{
  return MEMORY[0x1F4185B20]();
}

uint64_t sub_1A8A785E8()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1A8A785F8()
{
  return MEMORY[0x1F4185BB0]();
}

uint64_t sub_1A8A78608()
{
  return MEMORY[0x1F4185CF8]();
}

uint64_t sub_1A8A78618()
{
  return MEMORY[0x1F4185D10]();
}

uint64_t sub_1A8A78628()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1A8A78638()
{
  return MEMORY[0x1F4185D58]();
}

uint64_t sub_1A8A78648()
{
  return MEMORY[0x1F4185D60]();
}

uint64_t sub_1A8A78658()
{
  return MEMORY[0x1F4185D78]();
}

uint64_t sub_1A8A78668()
{
  return MEMORY[0x1F4185D80]();
}

uint64_t sub_1A8A78678()
{
  return MEMORY[0x1F4185D90]();
}

uint64_t sub_1A8A78688()
{
  return MEMORY[0x1F4185DA0]();
}

uint64_t sub_1A8A78698()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1A8A786A8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1A8A786B8()
{
  return MEMORY[0x1F40E6E10]();
}

uint64_t sub_1A8A786C8()
{
  return MEMORY[0x1F40E6E20]();
}

uint64_t sub_1A8A786D8()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1A8A786E8()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1A8A786F8()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1A8A78708()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1A8A78718()
{
  return MEMORY[0x1F40E6E60]();
}

uint64_t sub_1A8A78728()
{
  return MEMORY[0x1F4185E78]();
}

uint64_t sub_1A8A78738()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1A8A78748()
{
  return MEMORY[0x1F4185EB8]();
}

uint64_t sub_1A8A78758()
{
  return MEMORY[0x1F4185EC0]();
}

uint64_t sub_1A8A78768()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1A8A78778()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1A8A78788()
{
  return MEMORY[0x1F4185ED8]();
}

uint64_t sub_1A8A78798()
{
  return MEMORY[0x1F4185EE0]();
}

uint64_t sub_1A8A787A8()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1A8A787B8()
{
  return MEMORY[0x1F4185EF0]();
}

uint64_t sub_1A8A787C8()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1A8A787D8()
{
  return MEMORY[0x1F4185F00]();
}

uint64_t sub_1A8A787E8()
{
  return MEMORY[0x1F4185F28]();
}

uint64_t sub_1A8A787F8()
{
  return MEMORY[0x1F4185F38]();
}

uint64_t sub_1A8A78808()
{
  return MEMORY[0x1F4185F60]();
}

uint64_t sub_1A8A78818()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t sub_1A8A78828()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1A8A78838()
{
  return MEMORY[0x1F4185FD8]();
}

uint64_t sub_1A8A78848()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t sub_1A8A78858()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1A8A78868()
{
  return MEMORY[0x1F4186040]();
}

uint64_t sub_1A8A78878()
{
  return MEMORY[0x1F4186048]();
}

uint64_t sub_1A8A78888()
{
  return MEMORY[0x1F4186050]();
}

uint64_t sub_1A8A78898()
{
  return MEMORY[0x1F41860C0]();
}

uint64_t sub_1A8A788A8()
{
  return MEMORY[0x1F41860E8]();
}

uint64_t sub_1A8A788B8()
{
  return MEMORY[0x1F41860F0]();
}

uint64_t sub_1A8A788C8()
{
  return MEMORY[0x1F4186110]();
}

uint64_t sub_1A8A788D8()
{
  return MEMORY[0x1F4186118]();
}

uint64_t sub_1A8A78928()
{
  return MEMORY[0x1F41861D8]();
}

uint64_t sub_1A8A78938()
{
  return MEMORY[0x1F41861E0]();
}

uint64_t sub_1A8A78948()
{
  return MEMORY[0x1F41861E8]();
}

uint64_t sub_1A8A78958()
{
  return MEMORY[0x1F41861F0]();
}

uint64_t sub_1A8A78968()
{
  return MEMORY[0x1F41861F8]();
}

uint64_t sub_1A8A78978()
{
  return MEMORY[0x1F4186200]();
}

uint64_t sub_1A8A78988()
{
  return MEMORY[0x1F4186208]();
}

uint64_t sub_1A8A78998()
{
  return MEMORY[0x1F4186210]();
}

uint64_t sub_1A8A789A8()
{
  return MEMORY[0x1F4186218]();
}

uint64_t sub_1A8A789B8()
{
  return MEMORY[0x1F4186220]();
}

uint64_t sub_1A8A789C8()
{
  return MEMORY[0x1F4186228]();
}

uint64_t sub_1A8A789D8()
{
  return MEMORY[0x1F4186230]();
}

uint64_t sub_1A8A789E8()
{
  return MEMORY[0x1F4186238]();
}

uint64_t sub_1A8A789F8()
{
  return MEMORY[0x1F4186240]();
}

uint64_t sub_1A8A78A08()
{
  return MEMORY[0x1F4186248]();
}

uint64_t sub_1A8A78A18()
{
  return MEMORY[0x1F4186250]();
}

uint64_t sub_1A8A78A28()
{
  return MEMORY[0x1F4186258]();
}

uint64_t sub_1A8A78A38()
{
  return MEMORY[0x1F4186268]();
}

uint64_t sub_1A8A78A48()
{
  return MEMORY[0x1F41862A8]();
}

uint64_t sub_1A8A78A58()
{
  return MEMORY[0x1F41862B0]();
}

uint64_t sub_1A8A78A68()
{
  return MEMORY[0x1F41862C0]();
}

uint64_t sub_1A8A78A78()
{
  return MEMORY[0x1F41862C8]();
}

uint64_t sub_1A8A78A88()
{
  return MEMORY[0x1F41862D0]();
}

uint64_t sub_1A8A78A98()
{
  return MEMORY[0x1F41862D8]();
}

uint64_t sub_1A8A78AA8()
{
  return MEMORY[0x1F41862E0]();
}

uint64_t sub_1A8A78AB8()
{
  return MEMORY[0x1F41862E8]();
}

uint64_t sub_1A8A78AC8()
{
  return MEMORY[0x1F41862F0]();
}

uint64_t sub_1A8A78AD8()
{
  return MEMORY[0x1F41862F8]();
}

uint64_t sub_1A8A78AE8()
{
  return MEMORY[0x1F4186300]();
}

uint64_t sub_1A8A78AF8()
{
  return MEMORY[0x1F4186308]();
}

uint64_t sub_1A8A78B08()
{
  return MEMORY[0x1F4186310]();
}

uint64_t sub_1A8A78B18()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1F40C94A8](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, dataIn, dataInLength);
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x1F40C96C8](bytes, count);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9718](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9720](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9728](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7110]();
}

void CFAllocatorSetDefault(CFAllocatorRef allocator)
{
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const void *value, CFComparatorFunction comparator, void *context)
{
  return MEMORY[0x1F40D7158](theArray, range.location, range.length, value, comparator, context);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C8](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

void CFCharacterSetAddCharactersInRange(CFMutableCharacterSetRef theSet, CFRange theRange)
{
}

void CFCharacterSetAddCharactersInString(CFMutableCharacterSetRef theSet, CFStringRef theString)
{
}

CFCharacterSetRef CFCharacterSetCreateCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7708](alloc, theSet);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutable(CFAllocatorRef alloc)
{
  return (CFMutableCharacterSetRef)MEMORY[0x1F40D7718](alloc);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutableCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFMutableCharacterSetRef)MEMORY[0x1F40D7720](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInRange(CFAllocatorRef alloc, CFRange theRange)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7730](alloc, theRange.location, theRange.length);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7738](alloc, theString);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7740](theSetIdentifier);
}

void CFCharacterSetInvert(CFMutableCharacterSetRef theSet)
{
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1F40D7770](theSet, theChar);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1F40D78B0](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x1F40D78E0](allocator, formatter, date);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BB8]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

CFAbsoluteTime CFRunLoopGetNextTimerFireDate(CFRunLoopRef rl, CFRunLoopMode mode)
{
  MEMORY[0x1F40D80C8](rl, mode);
  return result;
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1F40D8220](theSet);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1F40D8238](theSet, value);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringConvertEncodingToIANACharSetName(CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D83A0](*(void *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8440](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1F40D8460](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1F40D84D8](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x1F40D85E0]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1F40D8608](theString, suffix);
}

void CFStringInsert(CFMutableStringRef str, CFIndex idx, CFStringRef insertedStr)
{
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA300](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

BOOL CGImageDestinationCopyImageSource(CGImageDestinationRef idst, CGImageSourceRef isrc, CFDictionaryRef options, CFErrorRef *err)
{
  return MEMORY[0x1F40E9728](idst, isrc, options, err);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutableCopy(CGImageMetadataRef metadata)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1F40E97D0](metadata);
}

void CGImageMetadataEnumerateTagsUsingBlock(CGImageMetadataRef metadata, CFStringRef rootPath, CFDictionaryRef options, CGImageMetadataTagBlock block)
{
}

BOOL CGImageMetadataRemoveTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return MEMORY[0x1F40E9818](metadata, parent, path);
}

CFStringRef CGImageMetadataTagCopyName(CGImageMetadataTagRef tag)
{
  return (CFStringRef)MEMORY[0x1F40E9838](tag);
}

CFStringRef CGImageMetadataTagCopyPrefix(CGImageMetadataTagRef tag)
{
  return (CFStringRef)MEMORY[0x1F40E9848](tag);
}

CGImageMetadataRef CGImageSourceCopyMetadataAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageMetadataRef)MEMORY[0x1F40E9918](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1F40E9A18](isrc);
}

CGPDFDocumentRef CGPDFDocumentCreateWithProvider(CGDataProviderRef provider)
{
  return (CGPDFDocumentRef)MEMORY[0x1F40DAC48](provider);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return MEMORY[0x1F40DAC88](document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x1F40DAC90](document, pageNumber);
}

BOOL CGPDFDocumentIsUnlocked(CGPDFDocumentRef document)
{
  return MEMORY[0x1F40DACB0](document);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
}

uint64_t CPICUCreateSearchCollator()
{
  return MEMORY[0x1F4109320]();
}

uint64_t CPICUReleaseSearchCollator()
{
  return MEMORY[0x1F4109328]();
}

uint64_t CPPowerAssertionCreate()
{
  return MEMORY[0x1F41093B8]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t CTCellularDataPlanGetIsEnabled()
{
  return MEMORY[0x1F40DEF58]();
}

uint64_t DALoggingwithCategory()
{
  return MEMORY[0x1F4117130]();
}

uint64_t ECAssertNetworkActivityAllowed()
{
  return MEMORY[0x1F4117858]();
}

uint64_t ECBeginDisallowingNetworkActivity()
{
  return MEMORY[0x1F4117860]();
}

uint64_t ECEndDisallowingNetworkActivity()
{
  return MEMORY[0x1F4117870]();
}

uint64_t EDAttachmentsLog()
{
  return MEMORY[0x1F41179B0]();
}

uint64_t EDLibraryLog()
{
  return MEMORY[0x1F41179B8]();
}

uint64_t EFAtomicSetOnceObjectLoad()
{
  return MEMORY[0x1F4117A48]();
}

uint64_t EFAtomicSetOnceObjectRelease()
{
  return MEMORY[0x1F4117A50]();
}

uint64_t EFBundleIdentifierForXPCConnection()
{
  return MEMORY[0x1F4117A58]();
}

uint64_t EFContentProtectionDumpDiagnosticState()
{
  return MEMORY[0x1F4117A68]();
}

uint64_t EFContentProtectionGetDeviceLockState()
{
  return MEMORY[0x1F4117A70]();
}

uint64_t EFContentProtectionGetObservedState()
{
  return MEMORY[0x1F4117A78]();
}

uint64_t EFContentProtectionStateDescription()
{
  return MEMORY[0x1F4117A80]();
}

uint64_t EFCopyResponseDataForURLRequest()
{
  return MEMORY[0x1F4117A90]();
}

uint64_t EFFrameworkVersion()
{
  return MEMORY[0x1F4117AB8]();
}

uint64_t EFIsRunningUnitTests()
{
  return MEMORY[0x1F4117AC8]();
}

uint64_t EFIsSeedBuild()
{
  return MEMORY[0x1F4117AD0]();
}

uint64_t EFLogRegisterStateCaptureBlock()
{
  return MEMORY[0x1F4117AD8]();
}

uint64_t EFMarkFileAsPurgeableFD()
{
  return MEMORY[0x1F4117AE0]();
}

uint64_t EFObjectsAreEqual()
{
  return MEMORY[0x1F4117B00]();
}

uint64_t EFProductName()
{
  return MEMORY[0x1F4117B10]();
}

uint64_t EFProtectedDataAvailable()
{
  return MEMORY[0x1F4117B18]();
}

uint64_t EFProtectedDataAvailableInState()
{
  return MEMORY[0x1F4117B20]();
}

uint64_t EFRegisterContentProtectionObserver()
{
  return MEMORY[0x1F4117B28]();
}

uint64_t EFSaveTailspin()
{
  return MEMORY[0x1F4117B38]();
}

uint64_t EFStringWithInt()
{
  return MEMORY[0x1F4117B48]();
}

uint64_t EFStringWithInt64()
{
  return MEMORY[0x1F4117B50]();
}

uint64_t EFStringWithUnsignedInteger()
{
  return MEMORY[0x1F4117B60]();
}

uint64_t EFSystemBuildVersion()
{
  return MEMORY[0x1F4117B70]();
}

uint64_t EFSystemVersion()
{
  return MEMORY[0x1F4117B78]();
}

uint64_t EFUnregisterContentProtectionObserver()
{
  return MEMORY[0x1F4117B80]();
}

uint64_t EFVerifyFileProtectionType()
{
  return MEMORY[0x1F4117B88]();
}

uint64_t EMCategoryTypeFromString()
{
  return MEMORY[0x1F41177D8]();
}

uint64_t EMIsGreymatterSupportedWithOverride()
{
  return MEMORY[0x1F41177F0]();
}

uint64_t EMLogCategoryMessageLoading()
{
  return MEMORY[0x1F41177F8]();
}

uint64_t EMLogMailDrop()
{
  return MEMORY[0x1F4117808]();
}

uint64_t EMLogSearchableIndexStatus()
{
  return MEMORY[0x1F4117810]();
}

uint64_t EMStringFromCategoryType()
{
  return MEMORY[0x1F4117830]();
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x1F411CA28]();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1F40E8678](*(void *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1F40E8778](notifier);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

uint64_t IOPSCopyPowerSourcesByType()
{
  return MEMORY[0x1F40E90D8]();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return (CFArrayRef)MEMORY[0x1F40E90F0](blob);
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9118](blob, ps);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1F40E9148](refcon, thePortRef, callback, notifier);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

uint64_t MFAccountsLog()
{
  return MEMORY[0x1F412EF88]();
}

uint64_t MFAutoFetchLog()
{
  return MEMORY[0x1F412EF90]();
}

uint64_t MFCharsetForEncoding()
{
  return MEMORY[0x1F412C0A0]();
}

uint64_t MFCreateDataWithString()
{
  return MEMORY[0x1F412C0A8]();
}

uint64_t MFCreateStringWithBytes()
{
  return MEMORY[0x1F412C0B0]();
}

uint64_t MFCreateStringWithData()
{
  return MEMORY[0x1F412C0B8]();
}

uint64_t MFDataConsumerAppendDispatchData()
{
  return MEMORY[0x1F412C0C0]();
}

uint64_t MFDataConsumerConsumeCompleteData()
{
  return MEMORY[0x1F412C0C8]();
}

uint64_t MFEncodingForCharset()
{
  return MEMORY[0x1F412C0D0]();
}

uint64_t MFExchangeLog()
{
  return MEMORY[0x1F412EFA0]();
}

uint64_t MFGetMappedAllocator()
{
  return MEMORY[0x1F412C0D8]();
}

uint64_t MFGetRandomBytes()
{
  return MEMORY[0x1F412C0E0]();
}

uint64_t MFGetTypeInfo()
{
  return MEMORY[0x1F412C0E8]();
}

uint64_t MFGuessEncodingForBytes()
{
  return MEMORY[0x1F412C0F0]();
}

uint64_t MFIsMobileMail()
{
  return MEMORY[0x1F412EFB0]();
}

uint64_t MFLogGeneral()
{
  return MEMORY[0x1F412EFB8]();
}

uint64_t MFLogNetwork()
{
  return MEMORY[0x1F412EFC0]();
}

uint64_t MFMessageIDHashFromHeaders()
{
  return MEMORY[0x1F412C0F8]();
}

uint64_t MFMimePartParseContentDispositionHeader()
{
  return MEMORY[0x1F412C100]();
}

uint64_t MFMimePartParseContentTypeHeader()
{
  return MEMORY[0x1F412C108]();
}

uint64_t MFMimePartSetValueForPreservedHeader()
{
  return MEMORY[0x1F412C110]();
}

uint64_t MFMobileMailContainerPath()
{
  return MEMORY[0x1F412EFD8]();
}

uint64_t MFMobileMailPreferenceDomain()
{
  return MEMORY[0x1F412EFE0]();
}

uint64_t MFPersistenceLog()
{
  return MEMORY[0x1F412EFE8]();
}

uint64_t MFPowerLog()
{
  return MEMORY[0x1F412EFF0]();
}

uint64_t MFReconciliationLog()
{
  return MEMORY[0x1F412EFF8]();
}

uint64_t MFReconciliationSignpostLog()
{
  return MEMORY[0x1F412F000]();
}

uint64_t MFRemoveItemAtPath()
{
  return MEMORY[0x1F412C118]();
}

uint64_t MFSetUseLegacyMessageIDHashFormat()
{
  return MEMORY[0x1F412C120]();
}

uint64_t MFStringCanBeConvertedLosslessly()
{
  return MEMORY[0x1F412C128]();
}

uint64_t MFStringGetBytes()
{
  return MEMORY[0x1F412C130]();
}

uint64_t MFStringHashForMessageID()
{
  return MEMORY[0x1F412C138]();
}

uint64_t MFStringHashForMessageIDHeader()
{
  return MEMORY[0x1F412C140]();
}

uint64_t MFUniqueMessageIDHash()
{
  return MEMORY[0x1F412C148]();
}

uint64_t MF_MD5HMAC_Init()
{
  return MEMORY[0x1F412C150]();
}

uint64_t MF_MD5HMAC_InputBytes()
{
  return MEMORY[0x1F412C158]();
}

uint64_t MF_MD5HMAC_Output()
{
  return MEMORY[0x1F412C160]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

uint64_t NSBOOLFromString()
{
  return MEMORY[0x1F40E7000]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSUncaughtExceptionHandler *NSGetUncaughtExceptionHandler(void)
{
  return (NSUncaughtExceptionHandler *)MEMORY[0x1F40E70E0]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

void NSLog(NSString *format, ...)
{
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x1F40E71C8]();
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

void *__cdecl NSZoneCalloc(NSZone *zone, NSUInteger numElems, NSUInteger byteSize)
{
  return (void *)MEMORY[0x1F40E72F8](zone, numElems, byteSize);
}

void NSZoneFree(NSZone *zone, void *ptr)
{
}

void *__cdecl NSZoneMalloc(NSZone *zone, NSUInteger size)
{
  return (void *)MEMORY[0x1F40E7310](zone, size);
}

uint64_t NWCreateNSDataFromDispatchData()
{
  return MEMORY[0x1F40F27C8]();
}

uint64_t NtlmCreateClientRequest()
{
  return MEMORY[0x1F40F67F8]();
}

uint64_t NtlmCreateClientResponse()
{
  return MEMORY[0x1F40F6800]();
}

uint64_t NtlmGeneratorCreate()
{
  return MEMORY[0x1F40F6810]();
}

uint64_t NtlmGeneratorRelease()
{
  return MEMORY[0x1F40F6818]();
}

uint64_t PCSettingsGetPollInterval()
{
  return MEMORY[0x1F413F1C0]();
}

uint64_t PCSettingsGetStyle()
{
  return MEMORY[0x1F413F1C8]();
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return MEMORY[0x1F4145DC0]();
}

uint64_t PPSSendTelemetry()
{
  return MEMORY[0x1F4145DD0]();
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1F4101DA8](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1F4101DB0](allocator, name, callout, context);
}

CFRunLoopSourceRef SCDynamicStoreCreateRunLoopSource(CFAllocatorRef allocator, SCDynamicStoreRef store, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F4101DB8](allocator, store, order);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DD8](allocator, domain, entity);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x1F4101E18](store, keys, patterns);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EE8](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1F4101F08](target, flags);
}

Boolean SCNetworkReachabilityScheduleWithRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1F4101F18](target, runLoop, runLoopMode);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1F4101F20](target, callout, context);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x1F4101FF8](allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1F4102010](prefs, key);
}

Boolean SCPreferencesScheduleWithRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1F4102028](prefs, runLoop, runLoopMode);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return MEMORY[0x1F4102030](prefs, callout, context);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

Boolean SCPreferencesUnscheduleFromRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1F4102070](prefs, runLoop, runLoopMode);
}

uint64_t SecCertificateCopyProperties()
{
  return MEMORY[0x1F40F6B30]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1F40F6B80](allocator, data);
}

uint64_t SecCertificateGetKeyUsage()
{
  return MEMORY[0x1F40F6B98]();
}

uint64_t SecCertificateGetSHA1Digest()
{
  return MEMORY[0x1F40F6BA8]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x1F40F6BD0]();
}

uint64_t SecCertificateNotValidBefore()
{
  return MEMORY[0x1F40F6BD8]();
}

uint64_t SecCmsContentInfoGetContent()
{
  return MEMORY[0x1F40F6BE0]();
}

uint64_t SecCmsContentInfoGetContentTypeTag()
{
  return MEMORY[0x1F40F6BE8]();
}

uint64_t SecCmsContentInfoGetInnerContent()
{
  return MEMORY[0x1F40F6BF0]();
}

uint64_t SecCmsContentInfoSetContentData()
{
  return MEMORY[0x1F40F6BF8]();
}

uint64_t SecCmsContentInfoSetContentEnvelopedData()
{
  return MEMORY[0x1F40F6C00]();
}

uint64_t SecCmsContentInfoSetContentSignedData()
{
  return MEMORY[0x1F40F6C08]();
}

uint64_t SecCmsDecoderCreate()
{
  return MEMORY[0x1F40F6C10]();
}

uint64_t SecCmsDecoderDestroy()
{
  return MEMORY[0x1F40F6C18]();
}

uint64_t SecCmsDecoderFinish()
{
  return MEMORY[0x1F40F6C20]();
}

uint64_t SecCmsDecoderUpdate()
{
  return MEMORY[0x1F40F6C28]();
}

uint64_t SecCmsDigestContextDestroy()
{
  return MEMORY[0x1F40F6C30]();
}

uint64_t SecCmsDigestContextStartMultiple()
{
  return MEMORY[0x1F40F6C38]();
}

uint64_t SecCmsDigestContextUpdate()
{
  return MEMORY[0x1F40F6C40]();
}

uint64_t SecCmsEncoderDestroy()
{
  return MEMORY[0x1F40F6C48]();
}

uint64_t SecCmsEncoderFinish()
{
  return MEMORY[0x1F40F6C50]();
}

uint64_t SecCmsEnvelopedDataCreate()
{
  return MEMORY[0x1F40F6C58]();
}

uint64_t SecCmsEnvelopedDataGetContentInfo()
{
  return MEMORY[0x1F40F6C60]();
}

uint64_t SecCmsMessageContentLevel()
{
  return MEMORY[0x1F40F6C68]();
}

uint64_t SecCmsMessageContentLevelCount()
{
  return MEMORY[0x1F40F6C70]();
}

uint64_t SecCmsMessageCreate()
{
  return MEMORY[0x1F40F6C78]();
}

uint64_t SecCmsMessageDestroy()
{
  return MEMORY[0x1F40F6C80]();
}

uint64_t SecCmsMessageEncode()
{
  return MEMORY[0x1F40F6C88]();
}

uint64_t SecCmsMessageGetContent()
{
  return MEMORY[0x1F40F6C90]();
}

uint64_t SecCmsMessageGetContentInfo()
{
  return MEMORY[0x1F40F6C98]();
}

uint64_t SecCmsMessageIsEncrypted()
{
  return MEMORY[0x1F40F6CA0]();
}

uint64_t SecCmsRecipientInfoCreate()
{
  return MEMORY[0x1F40F6CA8]();
}

uint64_t SecCmsSignedDataAddCertChain()
{
  return MEMORY[0x1F40F6CB0]();
}

uint64_t SecCmsSignedDataCreate()
{
  return MEMORY[0x1F40F6CB8]();
}

uint64_t SecCmsSignedDataGetContentInfo()
{
  return MEMORY[0x1F40F6CC8]();
}

uint64_t SecCmsSignedDataGetDigestAlgs()
{
  return MEMORY[0x1F40F6CD0]();
}

uint64_t SecCmsSignedDataGetSignerInfo()
{
  return MEMORY[0x1F40F6CD8]();
}

uint64_t SecCmsSignedDataHasDigests()
{
  return MEMORY[0x1F40F6CE0]();
}

uint64_t SecCmsSignedDataSetDigestContext()
{
  return MEMORY[0x1F40F6CE8]();
}

uint64_t SecCmsSignedDataSignerInfoCount()
{
  return MEMORY[0x1F40F6CF0]();
}

uint64_t SecCmsSignedDataVerifySignerInfo()
{
  return MEMORY[0x1F40F6CF8]();
}

uint64_t SecCmsSignerInfoAddMSSMIMEEncKeyPrefs()
{
  return MEMORY[0x1F40F6D00]();
}

uint64_t SecCmsSignerInfoAddSMIMEEncKeyPrefs()
{
  return MEMORY[0x1F40F6D08]();
}

uint64_t SecCmsSignerInfoAddSigningTime()
{
  return MEMORY[0x1F40F6D10]();
}

uint64_t SecCmsSignerInfoCopyCertFromEncryptionKeyPreference()
{
  return MEMORY[0x1F40F6D18]();
}

uint64_t SecCmsSignerInfoCreate()
{
  return MEMORY[0x1F40F6D20]();
}

uint64_t SecCmsSignerInfoGetSignerEmailAddress()
{
  return MEMORY[0x1F40F6D28]();
}

uint64_t SecCmsSignerInfoGetVerificationStatus()
{
  return MEMORY[0x1F40F6D30]();
}

uint64_t SecCmsSignerInfoIncludeCerts()
{
  return MEMORY[0x1F40F6D38]();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x1F40F6D68](*(void *)&status, reserved);
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x1F40F6DB8](identityRef, certificateRef);
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x1F40F6DD0]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1F40F6E20](query, attributesToUpdate);
}

SecPolicyRef SecPolicyCreateRevocation(CFOptionFlags revocationFlags)
{
  return (SecPolicyRef)MEMORY[0x1F40F7078](revocationFlags);
}

CFDictionaryRef SecTaskCopyValuesForEntitlements(SecTaskRef task, CFArrayRef entitlements, CFErrorRef *error)
{
  return (CFDictionaryRef)MEMORY[0x1F40F7150](task, entitlements, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x1F40F7190](trust);
}

OSStatus SecTrustCopyPolicies(SecTrustRef trust, CFArrayRef *policies)
{
  return MEMORY[0x1F40F71C0](trust, policies);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1F40F71E0](certificates, policies, trust);
}

OSStatus SecTrustEvaluateAsyncWithError(SecTrustRef trust, dispatch_queue_t queue, SecTrustWithErrorCallback result)
{
  return MEMORY[0x1F40F7200](trust, queue, result);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x1F40F7290](trust, policies);
}

OSStatus SecTrustSetVerifyDate(SecTrustRef trust, CFDateRef verifyDate)
{
  return MEMORY[0x1F40F72A8](trust, verifyDate);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFPreferencesCopyKeyListWithContainer()
{
  return MEMORY[0x1F40D8F48]();
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return MEMORY[0x1F40D8F58]();
}

uint64_t _CFPreferencesSetValueWithContainer()
{
  return MEMORY[0x1F40D8FD0]();
}

uint64_t _CFPreferencesSynchronizeWithContainer()
{
  return MEMORY[0x1F40D8FD8]();
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x1F40D91E8]();
}

uint64_t _CTServerConnectionAddToRunLoop()
{
  return MEMORY[0x1F40DEFF0]();
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return MEMORY[0x1F40DF0E0]();
}

uint64_t _CTServerConnectionPacketContextAssertionCreate()
{
  return MEMORY[0x1F40DF1C0]();
}

uint64_t _EFLocalizedString()
{
  return MEMORY[0x1F4117B90]();
}

uint64_t _MFCopyDecodeText()
{
  return MEMORY[0x1F412C168]();
}

uint64_t _MFCreateStringFromHeaderBytes()
{
  return MEMORY[0x1F412C170]();
}

uint64_t _MFDecodeText()
{
  return MEMORY[0x1F412C178]();
}

uint64_t _MFLockGlobalLock()
{
  return MEMORY[0x1F412C180]();
}

uint64_t _MFOffsetFromThreadDictionary()
{
  return MEMORY[0x1F412C188]();
}

uint64_t _MFUnlockGlobalLock()
{
  return MEMORY[0x1F412C198]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E5B8](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E5D8](this, __s);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1F417E660](this, __str, __pos, __n, __a);
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1F40C9B60](lpfunc, obj, lpdso_handle);
}

void __cxa_free_exception(void *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x1F40C9C98](a1, a2, *(void *)&a3, a4, a5);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

uint64_t _availability_version_check()
{
  return MEMORY[0x1F40C9D48]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1F4186340]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x1F4186390]();
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

uint64_t archive_entry_free()
{
  return MEMORY[0x1F417DFF0]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x1F417DFF8]();
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x1F417E000]();
}

uint64_t archive_entry_set_filetype()
{
  return MEMORY[0x1F417E030]();
}

uint64_t archive_entry_set_mtime()
{
  return MEMORY[0x1F417E038]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x1F417E040]();
}

uint64_t archive_entry_set_perm()
{
  return MEMORY[0x1F417E048]();
}

uint64_t archive_entry_set_size()
{
  return MEMORY[0x1F417E050]();
}

uint64_t archive_entry_size()
{
  return MEMORY[0x1F417E058]();
}

uint64_t archive_entry_size_is_set()
{
  return MEMORY[0x1F417E060]();
}

uint64_t archive_read_data_block()
{
  return MEMORY[0x1F417E0A8]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x1F417E110]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x1F417E118]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x1F417E120]();
}

uint64_t archive_read_open_memory()
{
  return MEMORY[0x1F417E148]();
}

uint64_t archive_read_support_filter_all()
{
  return MEMORY[0x1F417E158]();
}

uint64_t archive_read_support_format_all()
{
  return MEMORY[0x1F417E180]();
}

uint64_t archive_set_error()
{
  return MEMORY[0x1F417E1B0]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x1F417E1D8]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x1F417E208]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x1F417E210]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x1F417E218]();
}

uint64_t archive_write_open()
{
  return MEMORY[0x1F417E220]();
}

uint64_t archive_write_set_format_zip()
{
  return MEMORY[0x1F417E260]();
}

uint64_t archive_write_set_options()
{
  return MEMORY[0x1F417E268]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

uint64_t atoll(const char *a1)
{
  return MEMORY[0x1F40CA4C8](a1);
}

void bzero(void *a1, size_t a2)
{
}

long double ceil(long double __x)
{
  MEMORY[0x1F40CB360](__x);
  return result;
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181518](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1F4181558](cls);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1F40CB3D8](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182BD0](strm, *(void *)&flush);
}

uLong deflateBound(z_streamp strm, uLong sourceLen)
{
  return MEMORY[0x1F4182BD8](strm, sourceLen);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182BE0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BE8](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

int deflateParams(z_streamp strm, int level, int strategy)
{
  return MEMORY[0x1F4182BF8](strm, *(void *)&level, *(void *)&strategy);
}

int deflatePending(z_streamp strm, unsigned int *pending, int *bits)
{
  return MEMORY[0x1F4182C00](strm, pending, bits);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA10](buffer, size, queue, destructor);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1F40CBA48](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCA0](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t ef_xpc_activity_register()
{
  return MEMORY[0x1F4117BA0]();
}

void exit(int a1)
{
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

long double floor(long double __x)
{
  MEMORY[0x1F40CC170](__x);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1F40CC1F0](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1F40CC290](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1F40CC2E0](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x1F40CC348](a1, a2, a3, a4);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return MEMORY[0x1F40CC370](*(void *)&a1, a2, a3, a4, a5);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1F40CC410](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

servent *__cdecl getservbyname(const char *a1, const char *a2)
{
  return (servent *)MEMORY[0x1F40CC540](a1, a2);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x1F40CC650](a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1F40CC678](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1F40CC680](*(void *)&a1, a2, a3);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182CB0](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182CB8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CC8](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

int isalnum(int _c)
{
  return MEMORY[0x1F40CC6A8](*(void *)&_c);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1F40CC728](*(void *)&a1, *(void *)&a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl memccpy(void *__dst, const void *__src, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD0](__dst, __src, *(void *)&__c, __n);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmem(const void *__big, size_t __big_len, const void *__little, size_t __little_len)
{
  return (void *)MEMORY[0x1F40CCD00](__big, __big_len, __little, __little_len);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1F41815F8](m);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1F40CCDE0](a1);
}

int mkstemp_dprotected_np(char *path, int dpclass, int dpflags)
{
  return MEMORY[0x1F40CCE10](path, *(void *)&dpclass, *(void *)&dpflags);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1F40CCE18](a1, *(void *)&a2);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x1F40CCE30](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

long double modf(long double __x, long double *__y)
{
  MEMORY[0x1F40CCE48](__y, __x);
  return result;
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

locale_t newlocale(int a1, const char *a2, locale_t a3)
{
  return (locale_t)MEMORY[0x1F40CCFF0](*(void *)&a1, a2, a3);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint64_t nw_connection_append_and_start_application_protocol()
{
  return MEMORY[0x1F40F2A48]();
}

void nw_connection_cancel(nw_connection_t connection)
{
}

uint64_t nw_connection_copy_connected_path()
{
  return MEMORY[0x1F40F2A80]();
}

nw_path_t nw_connection_copy_current_path(nw_connection_t connection)
{
  return (nw_path_t)MEMORY[0x1F40F2A90](connection);
}

nw_endpoint_t nw_connection_copy_endpoint(nw_connection_t connection)
{
  return (nw_endpoint_t)MEMORY[0x1F40F2AA0](connection);
}

nw_protocol_metadata_t nw_connection_copy_protocol_metadata(nw_connection_t connection, nw_protocol_definition_t definition)
{
  return (nw_protocol_metadata_t)MEMORY[0x1F40F2AD0](connection, definition);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1F40F2AE0](endpoint, parameters);
}

void nw_connection_force_cancel(nw_connection_t connection)
{
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
}

uint64_t nw_connection_set_cancel_handler()
{
  return MEMORY[0x1F40F2C58]();
}

uint64_t nw_connection_set_event_handler()
{
  return MEMORY[0x1F40F2C60]();
}

uint64_t nw_connection_set_low_throughput_handler()
{
  return MEMORY[0x1F40F2C70]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

uint64_t nw_connection_set_read_close_handler()
{
  return MEMORY[0x1F40F2C88]();
}

void nw_connection_set_viability_changed_handler(nw_connection_t connection, nw_connection_BOOLean_event_handler_t handler)
{
}

uint64_t nw_connection_set_write_close_handler()
{
  return MEMORY[0x1F40F2CA0]();
}

void nw_connection_start(nw_connection_t connection)
{
}

uint64_t nw_connection_state_to_string()
{
  return MEMORY[0x1F40F2CB8]();
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x1F40F2EA8](hostname, port);
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1F40F2F08](endpoint);
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return MEMORY[0x1F40F2F20](endpoint);
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x1F40F2F50](error);
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x1F40F34D0](configure_tls, configure_tcp);
}

uint64_t nw_parameters_set_account_id()
{
  return MEMORY[0x1F40F35A0]();
}

void nw_parameters_set_attribution(nw_parameters_t parameters, nw_parameters_attribution_t attribution)
{
}

uint64_t nw_parameters_set_required_netagent_classes()
{
  return MEMORY[0x1F40F3750]();
}

uint64_t nw_parameters_set_source_application_by_bundle_id()
{
  return MEMORY[0x1F40F3790]();
}

uint64_t nw_path_copy_interface()
{
  return MEMORY[0x1F40F3828]();
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return MEMORY[0x1F40F3960](path);
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x1F40F3A00](path, *(void *)&interface_type);
}

nw_protocol_definition_t nw_protocol_copy_tls_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x1F40F3A58]();
}

void nw_tcp_options_set_connection_timeout(nw_protocol_options_t options, uint32_t connection_timeout)
{
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x1F40F3F58](options);
}

nw_protocol_options_t nw_tls_create_options(void)
{
  return (nw_protocol_options_t)MEMORY[0x1F40F3F60]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

int putchar(int a1)
{
  return MEMORY[0x1F40CDBA8](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1F40CDC80](__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

void rewind(FILE *a1)
{
}

long double round(long double __x)
{
  MEMORY[0x1F40CDDC8](__x);
  return result;
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

SSLProtocol sec_protocol_metadata_get_negotiated_protocol_version(sec_protocol_metadata_t metadata)
{
  return MEMORY[0x1F40F7430](metadata);
}

tls_ciphersuite_t sec_protocol_metadata_get_negotiated_tls_ciphersuite(sec_protocol_metadata_t metadata)
{
  return (unsigned __int16)MEMORY[0x1F40F7438](metadata);
}

tls_protocol_version_t sec_protocol_metadata_get_negotiated_tls_protocol_version(sec_protocol_metadata_t metadata)
{
  return (unsigned __int16)MEMORY[0x1F40F7440](metadata);
}

const char *__cdecl sec_protocol_metadata_get_server_name(sec_protocol_metadata_t metadata)
{
  return (const char *)MEMORY[0x1F40F7448](metadata);
}

void sec_protocol_options_add_tls_application_protocol(sec_protocol_options_t options, const char *application_protocol)
{
}

void sec_protocol_options_set_local_identity(sec_protocol_options_t options, sec_identity_t identity)
{
}

void sec_protocol_options_set_min_tls_protocol_version(sec_protocol_options_t options, tls_protocol_version_t version)
{
}

void sec_protocol_options_set_verify_block(sec_protocol_options_t options, sec_protocol_verify_t verify_block, dispatch_queue_t verify_block_queue)
{
}

SecTrustRef sec_trust_copy_ref(sec_trust_t trust)
{
  return (SecTrustRef)MEMORY[0x1F40F75C0](trust);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1F4181B38](lhs, rhs);
}

uint64_t sharedDAAccountStore()
{
  return MEMORY[0x1F41170F8]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1F4181FD0](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

sqlite3 *__cdecl sqlite3_context_db_handle(sqlite3_context *a1)
{
  return (sqlite3 *)MEMORY[0x1F4182100](a1);
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return MEMORY[0x1F4182118](db, zFunctionName, *(void *)&nArg, *(void *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1F4182190](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x1F41821C8](a1, *(void *)&onoff);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1F41821D0](a1, zDbName, *(void *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

void sqlite3_free(void *a1)
{
}

void sqlite3_free_table(char **result)
{
}

int sqlite3_get_table(sqlite3 *db, const char *zSql, char ***pazResult, int *pnRow, int *pnColumn, char **pzErrmsg)
{
  return MEMORY[0x1F4182200](db, zSql, pazResult, pnRow, pnColumn, pzErrmsg);
}

void sqlite3_interrupt(sqlite3 *a1)
{
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1F4182230](a1);
}

char *sqlite3_mprintf(const char *a1, ...)
{
  return (char *)MEMORY[0x1F4182258](a1);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

void sqlite3_progress_handler(sqlite3 *a1, int a2, int (__cdecl *a3)(void *), void *a4)
{
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
}

void sqlite3_result_null(sqlite3_context *a1)
{
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return (void *)MEMORY[0x1F4182408](a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return MEMORY[0x1F4182418](a1);
}

int sqlite3_value_int(sqlite3_value *a1)
{
  return MEMORY[0x1F4182440](a1);
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x1F4182448](a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x1F4182458](a1);
}

char *__cdecl sqlite3_vmprintf(const char *a1, va_list a2)
{
  return (char *)MEMORY[0x1F4182480](a1, a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strftime_l(char *a1, size_t a2, const char *a3, const tm *a4, locale_t a5)
{
  return MEMORY[0x1F40CE1A0](a1, a2, a3, a4, a5);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1F40CE1D8](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

char *__cdecl strptime_l(const char *a1, const char *a2, tm *a3, locale_t a4)
{
  return (char *)MEMORY[0x1F40CE228](a1, a2, a3, a4);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_deallocBox()
{
  return MEMORY[0x1F4186480]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1F4186498]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x1F41864A8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1F41864C8]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1F41864D0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1F41864E8]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1F41864F0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1F4186578]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x1F4186630]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1F4186640]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x1F41866E8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1F4186708]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1F41867C0]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1F4186848]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1F4186850]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1F4186870]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1F4186878]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1F41868A0]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1F40CE3B8](*(void *)&a1);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

int32_t u_getIntPropertyValue(UChar32 c, UProperty which)
{
  return MEMORY[0x1F417F760](*(void *)&c, *(void *)&which);
}

UChar *__cdecl u_strFromUTF8(UChar *dest, int32_t destCapacity, int32_t *pDestLength, const char *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (UChar *)MEMORY[0x1F417F838](dest, *(void *)&destCapacity, pDestLength, src, *(void *)&srcLength, pErrorCode);
}

uint64_t ubrk_close()
{
  return MEMORY[0x1F417FA30]();
}

uint64_t ubrk_following()
{
  return MEMORY[0x1F417FA50]();
}

uint64_t ubrk_open()
{
  return MEMORY[0x1F417FA80]();
}

uint64_t ubrk_preceding()
{
  return MEMORY[0x1F417FA88]();
}

uint64_t ucnv_close()
{
  return MEMORY[0x1F417FC30]();
}

uint64_t ucnv_compareNames()
{
  return MEMORY[0x1F417FC38]();
}

uint64_t ucnv_countAliases()
{
  return MEMORY[0x1F417FC48]();
}

uint64_t ucnv_countAvailable()
{
  return MEMORY[0x1F417FC50]();
}

uint64_t ucnv_getAliases()
{
  return MEMORY[0x1F417FC70]();
}

uint64_t ucnv_getAvailableName()
{
  return MEMORY[0x1F417FC78]();
}

uint64_t ucnv_getCanonicalName()
{
  return MEMORY[0x1F417FC80]();
}

uint64_t ucnv_getMinCharSize()
{
  return MEMORY[0x1F417FCA0]();
}

uint64_t ucnv_open()
{
  return MEMORY[0x1F417FCB8]();
}

uint64_t ucnv_reset()
{
  return MEMORY[0x1F417FCC0]();
}

uint64_t ucnv_setFallback()
{
  return MEMORY[0x1F417FCD8]();
}

uint64_t ucnv_toUnicode()
{
  return MEMORY[0x1F417FD00]();
}

uint64_t ucol_setAttribute()
{
  return MEMORY[0x1F417FDC8]();
}

void uidna_close(UIDNA *idna)
{
}

int32_t uidna_nameToASCII_UTF8(const UIDNA *idna, const char *name, int32_t length, char *dest, int32_t capacity, UIDNAInfo *pInfo, UErrorCode *pErrorCode)
{
  return MEMORY[0x1F4180050](idna, name, *(void *)&length, dest, *(void *)&capacity, pInfo, pErrorCode);
}

UIDNA *__cdecl uidna_openUTS46(uint32_t options, UErrorCode *pErrorCode)
{
  return (UIDNA *)MEMORY[0x1F4180068](*(void *)&options, pErrorCode);
}

uint64_t unorm2_getNFCInstance()
{
  return MEMORY[0x1F4180230]();
}

uint64_t unorm2_normalizeSecondAndAppend()
{
  return MEMORY[0x1F4180260]();
}

uint64_t unorm2_spanQuickCheckYes()
{
  return MEMORY[0x1F4180270]();
}

uint64_t usearch_close()
{
  return MEMORY[0x1F4180610]();
}

uint64_t usearch_first()
{
  return MEMORY[0x1F4180618]();
}

uint64_t usearch_getMatchedLength()
{
  return MEMORY[0x1F4180628]();
}

uint64_t usearch_last()
{
  return MEMORY[0x1F4180630]();
}

uint64_t usearch_openFromCollator()
{
  return MEMORY[0x1F4180648]();
}

uint64_t usearch_setPattern()
{
  return MEMORY[0x1F4180670]();
}

uint64_t usearch_setText()
{
  return MEMORY[0x1F4180678]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

xmlNodePtr xmlDocGetRootElement(const xmlDoc *doc)
{
  return (xmlNodePtr)MEMORY[0x1F4182678](doc);
}

void xmlFreeDoc(xmlDocPtr cur)
{
}

xmlDocPtr xmlReadFile(const char *URL, const char *encoding, int options)
{
  return (xmlDocPtr)MEMORY[0x1F4182818](URL, encoding, *(void *)&options);
}

xmlDocPtr xmlReadMemory(const char *buffer, int size, const char *URL, const char *encoding, int options)
{
  return (xmlDocPtr)MEMORY[0x1F4182820](buffer, *(void *)&size, URL, encoding, *(void *)&options);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1F40CE978](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

uint64_t xpc_activity_set_completion_status()
{
  return MEMORY[0x1F40CE9B0]();
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE9E8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

uint64_t xpc_copy_clean_description()
{
  return MEMORY[0x1F40CED10]();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEE30]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1F40CF040](object1, object2);
}

uint64_t objc_msgSenduint64_tForQuery_connection_textArgument_(void *a1, const char *a2, ...)
{
  return MEMORY[0x1F4181798](a1, seluint64_tForQuery_connection_textArgument_);
}