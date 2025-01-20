@interface PDDepthProcessor
+ (unint64_t)expectedBanksPerFrameForRawSensorDimensions:(CGSize)a3;
+ (unint64_t)generatedPointCloudsLengthForRawSensorDimensions:(CGSize)a3;
+ (unint64_t)requiredStorageBytesForGeneratedPointCloudsForRawSensorDimensions:(CGSize)a3;
- (BOOL)_prepareForPeridotPreset:(int)a3;
- (BOOL)prepareDataPool;
- (BOOL)prepareForPeridotPreset:(int)a3 rawSensorDimensions:(CGSize)a4;
- (BOOL)setDataBufferPool:(__CVDataBufferPool *)a3;
- (BOOL)storeRawFramesInPointCloud;
- (PDDepthProcessor)initWithSystemCalibrationData:(id)a3;
- (id).cxx_construct;
- (id)delegate;
- (id)generatePointCloudFromRawFrame:(id)a3;
- (id)generatePointCloudFromRawFrame:(id)a3 timestamp:(id *)a4;
- (id)generatePointCloudFromRawFrame:(id)a3 timestamp:(id *)a4 usingDataBuffer:(__CVBuffer *)a5;
- (id)getInternalState;
- (unint64_t)expectedBanksPerFrame;
- (unint64_t)generatedPointCloudsLength;
- (unint64_t)requiredStorageBytesForGeneratedPointClouds;
- (void)dealloc;
- (void)reportSessionStatistics;
- (void)setDelegate:(id)a3;
- (void)setInternalState:(id)a3;
- (void)setStoreRawFramesInPointCloud:(BOOL)a3;
- (void)startNewStatisticsSession;
@end

@implementation PDDepthProcessor

+ (unint64_t)requiredStorageBytesForGeneratedPointCloudsForRawSensorDimensions:(CGSize)a3
{
  getInfoForDimensions(a3, (uint64_t)v4);
  return v4[5];
}

- (unint64_t)expectedBanksPerFrame
{
  return self->_presetInfo.banksPerFrame;
}

- (void)setInternalState:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)startNewStatisticsSession
{
}

- (id)generatePointCloudFromRawFrame:(id)a3 timestamp:(id *)a4
{
  id v6 = a3;
  CVBufferRef buffer = 0;
  if (self->_dataBufferPool || ([(PDDepthProcessor *)self prepareDataPool], self->_dataBufferPool))
  {
    if (CVDataBufferPoolCreateDataBuffer())
    {
      peridot_depth_log("Failed to create a data buffer from the pool");
      v7 = 0;
      goto LABEL_8;
    }
    CVBufferRef v8 = buffer;
  }
  else
  {
    CVBufferRef v8 = 0;
  }
  long long v10 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  v7 = [(PDDepthProcessor *)self generatePointCloudFromRawFrame:v6 timestamp:&v10 usingDataBuffer:v8];
  CVBufferRelease(buffer);
LABEL_8:

  return v7;
}

- (id)generatePointCloudFromRawFrame:(id)a3 timestamp:(id *)a4 usingDataBuffer:(__CVBuffer *)a5
{
  uint64_t v5 = ((uint64_t (*)(PDDepthProcessor *, SEL, id))MEMORY[0x270FA5388])(self, a2, a3);
  uint64_t v7 = v6;
  v98 = v8;
  uint64_t v9 = v5;
  uint64_t v125 = *MEMORY[0x263EF8340];
  id v11 = v10;
  int v105 = 335676444;
  long long v106 = 0u;
  long long v107 = 0u;
  v100 = v11;
  kdebug_trace();
  LODWORD(v124[5]) = 0;
  DWORD1(v124[10]) = 0;
  DWORD2(v124[15]) = 0;
  DWORD2(v124[23]) = 0;
  HIDWORD(v124[28]) = 0;
  LODWORD(v124[34]) = 0;
  LODWORD(v124[42]) = 0;
  DWORD1(v124[47]) = 0;
  DWORD2(v124[52]) = 0;
  DWORD2(v124[60]) = 0;
  HIDWORD(v124[65]) = 0;
  LODWORD(v124[71]) = 0;
  LODWORD(v124[79]) = 0;
  DWORD1(v124[84]) = 0;
  DWORD2(v124[89]) = 0;
  DWORD2(v124[97]) = 0;
  HIDWORD(v124[102]) = 0;
  LODWORD(v124[108]) = 0;
  LODWORD(v124[116]) = 0;
  DWORD1(v124[121]) = 0;
  DWORD2(v124[126]) = 0;
  DWORD2(v124[134]) = 0;
  HIDWORD(v124[139]) = 0;
  LODWORD(v124[145]) = 0;
  LODWORD(v124[153]) = 0;
  DWORD1(v124[158]) = 0;
  DWORD2(v124[163]) = 0;
  DWORD2(v124[171]) = 0;
  HIDWORD(v124[176]) = 0;
  LODWORD(v124[182]) = 0;
  LODWORD(v124[190]) = 0;
  DWORD1(v124[195]) = 0;
  DWORD2(v124[200]) = 0;
  DWORD2(v124[208]) = 0;
  HIDWORD(v124[213]) = 0;
  LODWORD(v124[219]) = 0;
  LODWORD(v124[227]) = 0;
  DWORD1(v124[232]) = 0;
  DWORD2(v124[237]) = 0;
  DWORD2(v124[245]) = 0;
  HIDWORD(v124[250]) = 0;
  LODWORD(v124[256]) = 0;
  LOBYTE(v124[259]) = -1;
  v124[264] = xmmword_259120090;
  DWORD1(v124[265]) = 16843009;
  BYTE8(v124[265]) = 0;
  HIDWORD(v124[265]) = 814313567;
  DWORD2(v124[266]) = 808933364;
  *(_OWORD *)((char *)&v124[267] + 4) = xmmword_2591200A0;
  *(void *)((char *)&v124[268] + 4) = 0x40E000003F400000;
  DWORD2(v124[269]) = 1065353216;
  WORD2(v124[270]) = 256;
  BYTE6(v124[270]) = 0;
  DWORD2(v124[270]) = 1082130432;
  LODWORD(v124[276]) = 0;
  DWORD1(v124[281]) = 0;
  DWORD2(v124[286]) = 0;
  DWORD2(v124[294]) = 0;
  HIDWORD(v124[299]) = 0;
  LODWORD(v124[305]) = 0;
  LODWORD(v124[313]) = 0;
  DWORD1(v124[318]) = 0;
  DWORD2(v124[323]) = 0;
  DWORD2(v124[331]) = 0;
  HIDWORD(v124[336]) = 0;
  LODWORD(v124[342]) = 0;
  LODWORD(v124[350]) = 0;
  DWORD1(v124[355]) = 0;
  DWORD2(v124[360]) = 0;
  DWORD2(v124[368]) = 0;
  HIDWORD(v124[373]) = 0;
  LODWORD(v124[379]) = 0;
  LODWORD(v124[387]) = 0;
  DWORD1(v124[392]) = 0;
  DWORD2(v124[397]) = 0;
  DWORD2(v124[405]) = 0;
  HIDWORD(v124[410]) = 0;
  LODWORD(v124[416]) = 0;
  LODWORD(v124[424]) = 0;
  DWORD1(v124[429]) = 0;
  DWORD2(v124[434]) = 0;
  DWORD2(v124[442]) = 0;
  HIDWORD(v124[447]) = 0;
  LODWORD(v124[453]) = 0;
  LODWORD(v124[461]) = 0;
  DWORD1(v124[466]) = 0;
  DWORD2(v124[471]) = 0;
  DWORD2(v124[479]) = 0;
  HIDWORD(v124[484]) = 0;
  LODWORD(v124[490]) = 0;
  LODWORD(v124[498]) = 0;
  DWORD1(v124[503]) = 0;
  DWORD2(v124[508]) = 0;
  DWORD2(v124[516]) = 0;
  HIDWORD(v124[521]) = 0;
  LODWORD(v124[527]) = 0;
  LOBYTE(v124[530]) = -1;
  v124[535] = xmmword_259120090;
  DWORD1(v124[536]) = 16843009;
  BYTE8(v124[536]) = 0;
  HIDWORD(v124[536]) = 814313567;
  DWORD2(v124[537]) = 808933364;
  *(_OWORD *)((char *)&v124[538] + 4) = xmmword_2591200A0;
  *(void *)((char *)&v124[539] + 4) = 0x40E000003F400000;
  DWORD2(v124[540]) = 1065353216;
  WORD2(v124[541]) = 256;
  BYTE6(v124[541]) = 0;
  DWORD2(v124[541]) = 1082130432;
  LODWORD(v124[547]) = 0;
  DWORD1(v124[552]) = 0;
  DWORD2(v124[557]) = 0;
  DWORD2(v124[565]) = 0;
  HIDWORD(v124[570]) = 0;
  LODWORD(v124[576]) = 0;
  LODWORD(v124[584]) = 0;
  DWORD1(v124[589]) = 0;
  DWORD2(v124[594]) = 0;
  DWORD2(v124[602]) = 0;
  HIDWORD(v124[607]) = 0;
  LODWORD(v124[613]) = 0;
  LODWORD(v124[621]) = 0;
  DWORD1(v124[626]) = 0;
  DWORD2(v124[631]) = 0;
  DWORD2(v124[639]) = 0;
  HIDWORD(v124[644]) = 0;
  LODWORD(v124[650]) = 0;
  LODWORD(v124[658]) = 0;
  DWORD1(v124[663]) = 0;
  DWORD2(v124[668]) = 0;
  DWORD2(v124[676]) = 0;
  HIDWORD(v124[681]) = 0;
  LODWORD(v124[687]) = 0;
  LODWORD(v124[695]) = 0;
  DWORD1(v124[700]) = 0;
  DWORD2(v124[705]) = 0;
  DWORD2(v124[713]) = 0;
  HIDWORD(v124[718]) = 0;
  LODWORD(v124[724]) = 0;
  LODWORD(v124[732]) = 0;
  DWORD1(v124[737]) = 0;
  DWORD2(v124[742]) = 0;
  DWORD2(v124[750]) = 0;
  HIDWORD(v124[755]) = 0;
  LODWORD(v124[761]) = 0;
  LODWORD(v124[769]) = 0;
  DWORD1(v124[774]) = 0;
  DWORD2(v124[779]) = 0;
  DWORD2(v124[787]) = 0;
  HIDWORD(v124[792]) = 0;
  LODWORD(v124[798]) = 0;
  LOBYTE(v124[801]) = -1;
  v124[806] = xmmword_259120090;
  DWORD1(v124[807]) = 16843009;
  BYTE8(v124[807]) = 0;
  HIDWORD(v124[807]) = 814313567;
  DWORD2(v124[808]) = 808933364;
  *(_OWORD *)((char *)&v124[809] + 4) = xmmword_2591200A0;
  *(void *)((char *)&v124[810] + 4) = 0x40E000003F400000;
  DWORD2(v124[811]) = 1065353216;
  WORD2(v124[812]) = 256;
  BYTE6(v124[812]) = 0;
  DWORD2(v124[812]) = 1082130432;
  LODWORD(v124[818]) = 0;
  DWORD1(v124[823]) = 0;
  DWORD2(v124[828]) = 0;
  DWORD2(v124[836]) = 0;
  HIDWORD(v124[841]) = 0;
  LODWORD(v124[847]) = 0;
  LODWORD(v124[855]) = 0;
  DWORD1(v124[860]) = 0;
  DWORD2(v124[865]) = 0;
  DWORD2(v124[873]) = 0;
  HIDWORD(v124[878]) = 0;
  LODWORD(v124[884]) = 0;
  LODWORD(v124[892]) = 0;
  DWORD1(v124[897]) = 0;
  DWORD2(v124[902]) = 0;
  DWORD2(v124[910]) = 0;
  HIDWORD(v124[915]) = 0;
  LODWORD(v124[921]) = 0;
  LODWORD(v124[929]) = 0;
  DWORD1(v124[934]) = 0;
  DWORD2(v124[939]) = 0;
  DWORD2(v124[947]) = 0;
  HIDWORD(v124[952]) = 0;
  LODWORD(v124[958]) = 0;
  LODWORD(v124[966]) = 0;
  DWORD1(v124[971]) = 0;
  DWORD2(v124[976]) = 0;
  DWORD2(v124[984]) = 0;
  HIDWORD(v124[989]) = 0;
  LODWORD(v124[995]) = 0;
  LODWORD(v124[1003]) = 0;
  DWORD1(v124[1008]) = 0;
  DWORD2(v124[1013]) = 0;
  DWORD2(v124[1021]) = 0;
  HIDWORD(v124[1026]) = 0;
  LODWORD(v124[1032]) = 0;
  LODWORD(v124[1040]) = 0;
  DWORD1(v124[1045]) = 0;
  DWORD2(v124[1050]) = 0;
  DWORD2(v124[1058]) = 0;
  HIDWORD(v124[1063]) = 0;
  LODWORD(v124[1069]) = 0;
  LOBYTE(v124[1072]) = -1;
  v124[1077] = xmmword_259120090;
  DWORD1(v124[1078]) = 16843009;
  BYTE8(v124[1078]) = 0;
  HIDWORD(v124[1078]) = 814313567;
  DWORD2(v124[1079]) = 808933364;
  *(_OWORD *)((char *)&v124[1080] + 4) = xmmword_2591200A0;
  *(void *)((char *)&v124[1081] + 4) = 0x40E000003F400000;
  DWORD2(v124[1082]) = 1065353216;
  WORD2(v124[1083]) = 256;
  BYTE6(v124[1083]) = 0;
  DWORD2(v124[1083]) = 1082130432;
  LODWORD(v124[1089]) = 0;
  DWORD1(v124[1094]) = 0;
  DWORD2(v124[1099]) = 0;
  DWORD2(v124[1107]) = 0;
  HIDWORD(v124[1112]) = 0;
  LODWORD(v124[1118]) = 0;
  LODWORD(v124[1126]) = 0;
  DWORD1(v124[1131]) = 0;
  DWORD2(v124[1136]) = 0;
  DWORD2(v124[1144]) = 0;
  HIDWORD(v124[1149]) = 0;
  LODWORD(v124[1155]) = 0;
  LODWORD(v124[1163]) = 0;
  DWORD1(v124[1168]) = 0;
  DWORD2(v124[1173]) = 0;
  DWORD2(v124[1181]) = 0;
  HIDWORD(v124[1186]) = 0;
  LODWORD(v124[1192]) = 0;
  LODWORD(v124[1200]) = 0;
  DWORD1(v124[1205]) = 0;
  DWORD2(v124[1210]) = 0;
  DWORD2(v124[1218]) = 0;
  HIDWORD(v124[1223]) = 0;
  LODWORD(v124[1229]) = 0;
  LODWORD(v124[1237]) = 0;
  DWORD1(v124[1242]) = 0;
  DWORD2(v124[1247]) = 0;
  DWORD2(v124[1255]) = 0;
  HIDWORD(v124[1260]) = 0;
  LODWORD(v124[1266]) = 0;
  LODWORD(v124[1274]) = 0;
  DWORD1(v124[1279]) = 0;
  DWORD2(v124[1284]) = 0;
  DWORD2(v124[1292]) = 0;
  HIDWORD(v124[1297]) = 0;
  LODWORD(v124[1303]) = 0;
  LODWORD(v124[1311]) = 0;
  DWORD1(v124[1316]) = 0;
  DWORD2(v124[1321]) = 0;
  DWORD2(v124[1329]) = 0;
  HIDWORD(v124[1334]) = 0;
  LODWORD(v124[1340]) = 0;
  LOBYTE(v124[1343]) = -1;
  v124[1348] = xmmword_259120090;
  DWORD1(v124[1349]) = 16843009;
  BYTE8(v124[1349]) = 0;
  HIDWORD(v124[1349]) = 814313567;
  DWORD2(v124[1350]) = 808933364;
  *(_OWORD *)((char *)&v124[1351] + 4) = xmmword_2591200A0;
  *(void *)((char *)&v124[1352] + 4) = 0x40E000003F400000;
  DWORD2(v124[1353]) = 1065353216;
  WORD2(v124[1354]) = 256;
  BYTE6(v124[1354]) = 0;
  DWORD2(v124[1354]) = 1082130432;
  LODWORD(v124[1360]) = 0;
  DWORD1(v124[1365]) = 0;
  DWORD2(v124[1370]) = 0;
  DWORD2(v124[1378]) = 0;
  HIDWORD(v124[1383]) = 0;
  LODWORD(v124[1389]) = 0;
  LODWORD(v124[1397]) = 0;
  DWORD1(v124[1402]) = 0;
  DWORD2(v124[1407]) = 0;
  DWORD2(v124[1415]) = 0;
  HIDWORD(v124[1420]) = 0;
  LODWORD(v124[1426]) = 0;
  LODWORD(v124[1434]) = 0;
  DWORD1(v124[1439]) = 0;
  DWORD2(v124[1444]) = 0;
  DWORD2(v124[1452]) = 0;
  HIDWORD(v124[1457]) = 0;
  LODWORD(v124[1463]) = 0;
  LODWORD(v124[1471]) = 0;
  DWORD1(v124[1476]) = 0;
  DWORD2(v124[1481]) = 0;
  DWORD2(v124[1489]) = 0;
  HIDWORD(v124[1494]) = 0;
  LODWORD(v124[1500]) = 0;
  LODWORD(v124[1508]) = 0;
  DWORD1(v124[1513]) = 0;
  DWORD2(v124[1518]) = 0;
  DWORD2(v124[1526]) = 0;
  HIDWORD(v124[1531]) = 0;
  LODWORD(v124[1537]) = 0;
  LODWORD(v124[1545]) = 0;
  DWORD1(v124[1550]) = 0;
  DWORD2(v124[1555]) = 0;
  DWORD2(v124[1563]) = 0;
  HIDWORD(v124[1568]) = 0;
  LODWORD(v124[1574]) = 0;
  LODWORD(v124[1582]) = 0;
  DWORD1(v124[1587]) = 0;
  DWORD2(v124[1592]) = 0;
  DWORD2(v124[1600]) = 0;
  HIDWORD(v124[1605]) = 0;
  LODWORD(v124[1611]) = 0;
  LOBYTE(v124[1614]) = -1;
  v124[1619] = xmmword_259120090;
  DWORD1(v124[1620]) = 16843009;
  BYTE8(v124[1620]) = 0;
  HIDWORD(v124[1620]) = 814313567;
  DWORD2(v124[1621]) = 808933364;
  *(_OWORD *)((char *)&v124[1622] + 4) = xmmword_2591200A0;
  *(void *)((char *)&v124[1623] + 4) = 0x40E000003F400000;
  DWORD2(v124[1624]) = 1065353216;
  WORD2(v124[1625]) = 256;
  BYTE6(v124[1625]) = 0;
  DWORD2(v124[1625]) = 1082130432;
  LODWORD(v124[1631]) = 0;
  DWORD1(v124[1636]) = 0;
  DWORD2(v124[1641]) = 0;
  DWORD2(v124[1649]) = 0;
  HIDWORD(v124[1654]) = 0;
  LODWORD(v124[1660]) = 0;
  LODWORD(v124[1668]) = 0;
  DWORD1(v124[1673]) = 0;
  DWORD2(v124[1678]) = 0;
  DWORD2(v124[1686]) = 0;
  HIDWORD(v124[1691]) = 0;
  LODWORD(v124[1697]) = 0;
  LODWORD(v124[1705]) = 0;
  DWORD1(v124[1710]) = 0;
  DWORD2(v124[1715]) = 0;
  DWORD2(v124[1723]) = 0;
  HIDWORD(v124[1728]) = 0;
  LODWORD(v124[1734]) = 0;
  LODWORD(v124[1742]) = 0;
  DWORD1(v124[1747]) = 0;
  DWORD2(v124[1752]) = 0;
  DWORD2(v124[1760]) = 0;
  HIDWORD(v124[1765]) = 0;
  LODWORD(v124[1771]) = 0;
  LODWORD(v124[1779]) = 0;
  DWORD1(v124[1784]) = 0;
  DWORD2(v124[1789]) = 0;
  DWORD2(v124[1797]) = 0;
  HIDWORD(v124[1802]) = 0;
  LODWORD(v124[1808]) = 0;
  LODWORD(v124[1816]) = 0;
  DWORD1(v124[1821]) = 0;
  DWORD2(v124[1826]) = 0;
  DWORD2(v124[1834]) = 0;
  HIDWORD(v124[1839]) = 0;
  LODWORD(v124[1845]) = 0;
  LODWORD(v124[1853]) = 0;
  DWORD1(v124[1858]) = 0;
  DWORD2(v124[1863]) = 0;
  DWORD2(v124[1871]) = 0;
  HIDWORD(v124[1876]) = 0;
  LODWORD(v124[1882]) = 0;
  LOBYTE(v124[1885]) = -1;
  v124[1890] = xmmword_259120090;
  DWORD1(v124[1891]) = 16843009;
  BYTE8(v124[1891]) = 0;
  HIDWORD(v124[1891]) = 814313567;
  DWORD2(v124[1892]) = 808933364;
  *(_OWORD *)((char *)&v124[1893] + 4) = xmmword_2591200A0;
  *(void *)((char *)&v124[1894] + 4) = 0x40E000003F400000;
  DWORD2(v124[1895]) = 1065353216;
  BYTE4(v124[1896]) = 0;
  *(_WORD *)((char *)&v124[1896] + 5) = 1;
  DWORD2(v124[1896]) = 1082130432;
  LODWORD(v124[1902]) = 0;
  DWORD1(v124[1907]) = 0;
  DWORD2(v124[1912]) = 0;
  DWORD2(v124[1920]) = 0;
  HIDWORD(v124[1925]) = 0;
  LODWORD(v124[1931]) = 0;
  LODWORD(v124[1939]) = 0;
  DWORD1(v124[1944]) = 0;
  DWORD2(v124[1949]) = 0;
  DWORD2(v124[1957]) = 0;
  HIDWORD(v124[1962]) = 0;
  LODWORD(v124[1968]) = 0;
  LODWORD(v124[1976]) = 0;
  DWORD1(v124[1981]) = 0;
  DWORD2(v124[1986]) = 0;
  DWORD2(v124[1994]) = 0;
  HIDWORD(v124[1999]) = 0;
  LODWORD(v124[2005]) = 0;
  LODWORD(v124[2013]) = 0;
  DWORD1(v124[2018]) = 0;
  DWORD2(v124[2023]) = 0;
  DWORD2(v124[2031]) = 0;
  HIDWORD(v124[2036]) = 0;
  LODWORD(v124[2042]) = 0;
  LODWORD(v124[2050]) = 0;
  DWORD1(v124[2055]) = 0;
  DWORD2(v124[2060]) = 0;
  DWORD2(v124[2068]) = 0;
  HIDWORD(v124[2073]) = 0;
  LODWORD(v124[2079]) = 0;
  LODWORD(v124[2087]) = 0;
  DWORD1(v124[2092]) = 0;
  DWORD2(v124[2097]) = 0;
  DWORD2(v124[2105]) = 0;
  HIDWORD(v124[2110]) = 0;
  LODWORD(v124[2116]) = 0;
  LODWORD(v124[2124]) = 0;
  DWORD1(v124[2129]) = 0;
  DWORD2(v124[2134]) = 0;
  DWORD2(v124[2142]) = 0;
  HIDWORD(v124[2147]) = 0;
  LODWORD(v124[2153]) = 0;
  LOBYTE(v124[2156]) = -1;
  v124[2161] = xmmword_259120090;
  DWORD1(v124[2162]) = 16843009;
  BYTE8(v124[2162]) = 0;
  HIDWORD(v124[2162]) = 814313567;
  DWORD2(v124[2163]) = 808933364;
  *(_OWORD *)((char *)&v124[2164] + 4) = xmmword_2591200A0;
  *(void *)((char *)&v124[2165] + 4) = 0x40E000003F400000;
  DWORD2(v124[2166]) = 1065353216;
  BYTE4(v124[2167]) = 0;
  *(_WORD *)((char *)&v124[2167] + 5) = 1;
  DWORD2(v124[2167]) = 1082130432;
  uint64_t v104 = *(void *)(v9 + 24);
  ++*(void *)(v9 + 104);
  v101 = +[PDUserDefaults defaults];
  uint64_t v99 = v9;
  if (![v101 loopDxpResults] || *(void *)(v9 + 104) < 0x14uLL)
  {
    id v102 = 0;
LABEL_7:
    v116[0] = 0u;
    memset(&v115[16], 0, 80);
    memset(&v116[2], 0, 96);
    memset(&v117[16], 0, 96);
    memset(&v117[128], 0, 96);
    memset(&v118[16], 0, 96);
    memset(&v118[128], 0, 96);
    memset(&v119[16], 0, 96);
    memset(&v119[128], 0, 96);
    memset(&v120[16], 0, 96);
    memset(&v120[128], 0, 96);
    memset(&v121[16], 0, 96);
    memset(&v121[128], 0, 96);
    memset(&v122[16], 0, 96);
    memset(&v122[128], 0, 96);
    memset(&v123[16], 0, 96);
    uint64_t v17 = -21568;
    memset(&v123[128], 0, 96);
    do
    {
      v18 = (char *)&v110 + v17;
      *((void *)v18 + 2698) = 0;
      *((_OWORD *)v18 + 1348) = 0uLL;
      *((void *)v18 + 2700) = 0;
      *(_OWORD *)&v115[v17 + 40] = 0uLL;
      *((void *)v18 + 2704) = 0;
      *(_OWORD *)&v115[v17 + 72] = 0uLL;
      *((void *)v18 + 2708) = 0;
      *(_OWORD *)((char *)v116 + v17 + 8) = 0uLL;
      *((void *)v18 + 2712) = 0;
      *(_OWORD *)((char *)&v116[2] + v17 + 8) = 0uLL;
      *((_OWORD *)v18 + 1358) = 0uLL;
      *((void *)v18 + 2718) = 0;
      *((_OWORD *)v18 + 1360) = 0uLL;
      *((void *)v18 + 2722) = 0;
      *((_OWORD *)v18 + 1362) = 0uLL;
      *((void *)v18 + 2726) = 0;
      *((_OWORD *)v18 + 1364) = 0uLL;
      *((void *)v18 + 2730) = 0;
      *((void *)v18 + 2734) = 0;
      *((_OWORD *)v18 + 1366) = 0uLL;
      *((void *)v18 + 2738) = 0;
      *((_OWORD *)v18 + 1368) = 0uLL;
      *((void *)v18 + 2742) = 0;
      *((_OWORD *)v18 + 1370) = 0uLL;
      *((void *)v18 + 2746) = 0;
      *((_OWORD *)v18 + 1372) = 0uLL;
      *((void *)v18 + 2750) = 0;
      *((_OWORD *)v18 + 1374) = 0uLL;
      *((void *)v18 + 2754) = 0;
      *((_OWORD *)v18 + 1376) = 0uLL;
      *((void *)v18 + 2758) = 0;
      *((_OWORD *)v18 + 1378) = 0uLL;
      *((void *)v18 + 2762) = 0;
      *((_OWORD *)v18 + 1380) = 0uLL;
      *((void *)v18 + 2766) = 0;
      *((_OWORD *)v18 + 1382) = 0uLL;
      *((void *)v18 + 2770) = 0;
      *((_OWORD *)v18 + 1384) = 0uLL;
      *((void *)v18 + 2774) = 0;
      *((_OWORD *)v18 + 1386) = 0uLL;
      *((void *)v18 + 2778) = 0;
      *((_OWORD *)v18 + 1388) = 0uLL;
      *((void *)v18 + 2782) = 0;
      *((_OWORD *)v18 + 1390) = 0uLL;
      *((void *)v18 + 2786) = 0;
      *((_OWORD *)v18 + 1392) = 0uLL;
      *((void *)v18 + 2790) = 0;
      *((_OWORD *)v18 + 1394) = 0uLL;
      *((void *)v18 + 2794) = 0;
      *((_OWORD *)v18 + 1396) = 0uLL;
      *((void *)v18 + 2798) = 0;
      *((_OWORD *)v18 + 1398) = 0uLL;
      *((void *)v18 + 2802) = 0;
      *((_OWORD *)v18 + 1400) = 0uLL;
      *((void *)v18 + 2806) = 0;
      *((_OWORD *)v18 + 1402) = 0uLL;
      *((void *)v18 + 2810) = 0;
      *((_OWORD *)v18 + 1404) = 0uLL;
      *((void *)v18 + 2814) = 0;
      *((_OWORD *)v18 + 1406) = 0uLL;
      *((void *)v18 + 2818) = 0;
      *((_OWORD *)v18 + 1408) = 0uLL;
      *((void *)v18 + 2822) = 0;
      *((_OWORD *)v18 + 1410) = 0uLL;
      *((void *)v18 + 2826) = 0;
      *((_OWORD *)v18 + 1412) = 0uLL;
      *((void *)v18 + 2830) = 0;
      *((_OWORD *)v18 + 1414) = 0uLL;
      *((void *)v18 + 2834) = 0;
      *((_OWORD *)v18 + 1416) = 0uLL;
      *((void *)v18 + 2838) = 0;
      *((_OWORD *)v18 + 1418) = 0uLL;
      *((void *)v18 + 2842) = 0;
      *((_OWORD *)v18 + 1420) = 0uLL;
      *((void *)v18 + 2846) = 0;
      *((_OWORD *)v18 + 1422) = 0uLL;
      *((void *)v18 + 2850) = 0;
      *((_OWORD *)v18 + 1424) = 0uLL;
      *((void *)v18 + 2854) = 0;
      *((_OWORD *)v18 + 1426) = 0uLL;
      *((void *)v18 + 2858) = 0;
      *((_OWORD *)v18 + 1428) = 0uLL;
      *((void *)v18 + 2862) = 0;
      *((_OWORD *)v18 + 1430) = 0uLL;
      *((void *)v18 + 2866) = 0;
      *((_OWORD *)v18 + 1432) = 0uLL;
      *((void *)v18 + 2870) = 0;
      *((_OWORD *)v18 + 1434) = 0uLL;
      *((void *)v18 + 2874) = 0;
      *((_OWORD *)v18 + 1436) = 0uLL;
      *((void *)v18 + 2878) = 0;
      *((_OWORD *)v18 + 1438) = 0uLL;
      *((void *)v18 + 2882) = 0;
      *((_OWORD *)v18 + 1440) = 0uLL;
      *((void *)v18 + 2886) = 0;
      *((_OWORD *)v18 + 1442) = 0uLL;
      *((void *)v18 + 2890) = 0;
      *((_OWORD *)v18 + 1444) = 0uLL;
      *((void *)v18 + 2894) = 0;
      *((_OWORD *)v18 + 1446) = 0uLL;
      *((void *)v18 + 2898) = 0;
      *((_OWORD *)v18 + 1448) = 0uLL;
      *((void *)v18 + 2902) = 0;
      *((_OWORD *)v18 + 1450) = 0uLL;
      *((void *)v18 + 2906) = 0;
      *((_OWORD *)v18 + 1452) = 0uLL;
      *((void *)v18 + 2910) = 0;
      *((_OWORD *)v18 + 1454) = 0uLL;
      *((void *)v18 + 2914) = 0;
      *((_OWORD *)v18 + 1456) = 0uLL;
      *((void *)v18 + 2918) = 0;
      *((_OWORD *)v18 + 1458) = 0uLL;
      *((void *)v18 + 2922) = 0;
      *((_OWORD *)v18 + 1460) = 0uLL;
      *((void *)v18 + 2926) = 0;
      *((_OWORD *)v18 + 1462) = 0uLL;
      *((void *)v18 + 2930) = 0;
      *((_OWORD *)v18 + 1464) = 0uLL;
      *((void *)v18 + 2934) = 0;
      *((_OWORD *)v18 + 1466) = 0uLL;
      *((void *)v18 + 2938) = 0;
      *((_OWORD *)v18 + 1468) = 0uLL;
      *((void *)v18 + 2942) = 0;
      *((_OWORD *)v18 + 1470) = 0uLL;
      *((void *)v18 + 2946) = 0;
      *((_OWORD *)v18 + 1472) = 0uLL;
      *((void *)v18 + 2950) = 0;
      *((_OWORD *)v18 + 1474) = 0uLL;
      *((void *)v18 + 2954) = 0;
      *((_OWORD *)v18 + 1476) = 0uLL;
      *((void *)v18 + 2958) = 0;
      *((_OWORD *)v18 + 1478) = 0uLL;
      *((void *)v18 + 2962) = 0;
      *((_OWORD *)v18 + 1480) = 0uLL;
      *((void *)v18 + 2966) = 0;
      *((_OWORD *)v18 + 1482) = 0uLL;
      *((void *)v18 + 2970) = 0;
      *((_OWORD *)v18 + 1484) = 0uLL;
      *((void *)v18 + 2974) = 0;
      *((_OWORD *)v18 + 1486) = 0uLL;
      *((void *)v18 + 2978) = 0;
      *((_OWORD *)v18 + 1488) = 0uLL;
      *((void *)v18 + 2982) = 0;
      *((_OWORD *)v18 + 1490) = 0uLL;
      *((void *)v18 + 2986) = 0;
      *((_OWORD *)v18 + 1492) = 0uLL;
      *((void *)v18 + 2990) = 0;
      *((_OWORD *)v18 + 1494) = 0uLL;
      *((void *)v18 + 2994) = 0;
      *((_OWORD *)v18 + 1496) = 0uLL;
      *((void *)v18 + 2998) = 0;
      *((_OWORD *)v18 + 1498) = 0uLL;
      *((void *)v18 + 3002) = 0;
      *((_OWORD *)v18 + 1500) = 0uLL;
      *((void *)v18 + 3006) = 0;
      *((_OWORD *)v18 + 1502) = 0uLL;
      *((void *)v18 + 3010) = 0;
      *((_OWORD *)v18 + 1504) = 0uLL;
      *((void *)v18 + 3014) = 0;
      *((_OWORD *)v18 + 1506) = 0uLL;
      *((void *)v18 + 3018) = 0;
      *((_OWORD *)v18 + 1508) = 0uLL;
      *((void *)v18 + 3022) = 0;
      *((_OWORD *)v18 + 1510) = 0uLL;
      *((void *)v18 + 3026) = 0;
      *((_OWORD *)v18 + 1512) = 0uLL;
      *((void *)v18 + 3030) = 0;
      *((_OWORD *)v18 + 1514) = 0uLL;
      v17 += 2696;
    }
    while (v17);
    uint64_t v96 = v7;
    id v19 = v11;
    uint64_t v20 = [v19 bytes];
    uint64_t v21 = [v19 length];
    long long v108 = *v98;
    uint64_t v109 = *((void *)v98 + 2);
    uint64_t v94 = 0;
    if (peridot::PeridotAlgo::Impl::processSuperFrame(*(void *)(v9 + 72), v20, v21, *(float *)&v108))
    {
      if (LOBYTE(v124[259]) == 255)
      {
        uint64_t v22 = v104;
        if (v104)
        {
          uint64_t v23 = 0;
          v24 = (char *)&v124[147] + 12;
          do
          {
            v24[1780] = v23;
            bzero(v24 - 2364, 0x1030uLL);
            *(v24 - 1776) = 1;
            *(v24 - 1480) = 2;
            *(v24 - 1184) = 3;
            *(v24 - 888) = 4;
            *(v24 - 592) = 5;
            v25 = v24 - 296;
            char *v24 = 7;
            v24[296] = 8;
            v24[592] = 9;
            v24[888] = 10;
            v24[1184] = 11;
            v24[1480] = 12;
            v24[1776] = 13;
            ++v23;
            v24 += 4336;
            char *v25 = 6;
          }
          while (v22 != v23);
        }
      }
    }
    if (v102)
    {
      peridot_depth_log("Warning! Looping over DXP results. Storing results for bank %d", objc_msgSend(v102, "intValue", 0));
      *(void *)(v9 + 112) = v104;
      v26 = [MEMORY[0x263EFF8F8] dataWithBytes:v124 length:34688];
      [*(id *)(v9 + 120) setObject:v26 forKeyedSubscript:v102];
    }
    v27 = (uint64_t *)v115;
    uint64_t v28 = 21536;
    do
    {
      uint64_t v29 = 0;
      v27 -= 337;
      v30 = (char *)&v110 + v28;
      do
      {
        v31 = &v30[v29];
        v32 = *(void **)&v30[v29 - 8];
        if (v32)
        {
          *(void *)&v30[v29] = v32;
          operator delete(v32);
        }
        v33 = (void *)*((void *)v31 - 5);
        if (v33)
        {
          *(void *)&v30[v29 - 32] = v33;
          operator delete(v33);
        }
        v34 = &v30[v29];
        v35 = *(void **)&v30[v29 - 72];
        if (v35)
        {
          *((void *)v34 - 8) = v35;
          operator delete(v35);
        }
        v36 = (void *)*((void *)v34 - 13);
        if (v36)
        {
          *(void *)&v30[v29 - 96] = v36;
          operator delete(v36);
        }
        v37 = *(void **)&v30[v29 - 136];
        if (v37)
        {
          *(void *)&v30[v29 - 128] = v37;
          operator delete(v37);
        }
        v38 = (void *)*((void *)v31 - 21);
        if (v38)
        {
          *(void *)&v30[v29 - 160] = v38;
          operator delete(v38);
        }
        v29 -= 192;
      }
      while (v29 != -2688);
      v28 -= 2696;
    }
    while (v27 != &v110);
    peridot::PeridotSpotRefDepth::~PeridotSpotRefDepth((peridot::PeridotSpotRefDepth *)v123);
    peridot::PeridotSpotRefDepth::~PeridotSpotRefDepth((peridot::PeridotSpotRefDepth *)v122);
    peridot::PeridotSpotRefDepth::~PeridotSpotRefDepth((peridot::PeridotSpotRefDepth *)v121);
    peridot::PeridotSpotRefDepth::~PeridotSpotRefDepth((peridot::PeridotSpotRefDepth *)v120);
    peridot::PeridotSpotRefDepth::~PeridotSpotRefDepth((peridot::PeridotSpotRefDepth *)v119);
    peridot::PeridotSpotRefDepth::~PeridotSpotRefDepth((peridot::PeridotSpotRefDepth *)v118);
    peridot::PeridotSpotRefDepth::~PeridotSpotRefDepth((peridot::PeridotSpotRefDepth *)v117);
    peridot::PeridotSpotRefDepth::~PeridotSpotRefDepth((peridot::PeridotSpotRefDepth *)v115);
    uint64_t v7 = v96;
    goto LABEL_33;
  }
  uint64_t v114 = 0;
  uint64_t v110 = 0;
  *(void *)&long long v111 = 0;
  id v12 = v11;
  char v13 = PeridotSuperFrame::loadFromBuffer((PeridotSuperFrame *)&v110, (unsigned char *)[v12 bytes], objc_msgSend(v12, "length"), 0);
  if ((v13 & 1) == 0)
  {
    peridot_depth_log("Failed loading frame!");
    id v102 = 0;
    BOOL v16 = 1;
    uint64_t v83 = v114;
    if (!v114) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
  v14 = [NSNumber numberWithUnsignedChar:(*(unsigned char *)(v113[v113[351]] + 2) - 1)];
  v15 = [*(id *)(v9 + 120) objectForKeyedSubscript:v14];
  BOOL v16 = v15 == 0;
  if (v15)
  {
    peridot_depth_log("Warning! Looping over DXP results. Returning last results for bank %d", [v14 intValue]);
    memcpy(v124, (const void *)[v15 bytes], sizeof(v124));
    id v102 = 0;
    uint64_t v104 = *(void *)(v9 + 112);
  }
  else
  {
    id v102 = v14;
  }

  uint64_t v83 = v114;
  if (v114) {
LABEL_50:
  }
    MEMORY[0x25A2D62A0](v83, 0x1000C801E9FC43BLL);
LABEL_51:
  if ((v13 & 1) == 0)
  {
    v42 = 0;
    goto LABEL_69;
  }
  if (v16) {
    goto LABEL_7;
  }
LABEL_33:
  LODWORD(v110) = 335677008;
  long long v111 = 0u;
  long long v112 = 0u;
  kdebug_trace();
  uint64_t v39 = v104;
  if (*(unsigned char *)(v9 + 80)) {
    uint64_t v40 = [v11 length];
  }
  else {
    uint64_t v40 = 0;
  }
  if (objc_msgSend(MEMORY[0x263F26C98], "prepareDataBuffer:forLength:additionalDataSize:", v7, (42 * v104), v40, v94))
  {
    v41 = (void *)[objc_alloc(MEMORY[0x263F26CC0]) initWithDataBuffer:v7];
    v42 = v41;
    if (v41)
    {
      v97 = v41;
      uint64_t v43 = [v41 mutableCameraPixels];
      uint64_t v95 = [v42 mutableEuclideanDistances];
      uint64_t v44 = [v42 mutableConfidences];
      uint64_t v45 = [v42 mutableIntensities];
      uint64_t v46 = [v42 mutableSignalToNoiseRatios];
      uint64_t v47 = [v42 mutableBankIds];
      uint64_t v48 = [v42 mutableSpotIds];
      v49 = v42;
      uint64_t v50 = [v42 mutableEchoIds];
      uint64_t v51 = [v49 mutableFlags];
      if (v104)
      {
        uint64_t v52 = 0;
        v53 = (unsigned char *)(v47 + 2);
        v54 = (unsigned char *)(v48 + 2);
        v55 = (unsigned char *)(v50 + 2);
        v56 = (float64x2_t *)(v43 + 32);
        v57 = (float *)&v124[15] + 2;
        uint64_t v58 = v44 + 8;
        uint64_t v59 = v45 + 8;
        uint64_t v60 = v46 + 8;
        uint64_t v61 = v95 + 8;
        uint64_t v62 = v51 + 8;
        do
        {
          uint64_t v63 = 0;
          uint64_t v64 = 0;
          v65 = &v124[271 * v52 + 259];
          v66 = v57;
          v67 = v56;
          v68 = v55;
          v69 = v54;
          v70 = v53;
          do
          {
            *(v70 - 2) = *v65;
            *(v69 - 2) = v64;
            *(v68 - 2) = 0;
            v67[-2] = vcvtq_f64_f32(*(float32x2_t *)(v66 - 54));
            v71 = (_DWORD *)(v58 + v63);
            *(v71 - 2) = *((_DWORD *)v66 - 61);
            v72 = (_DWORD *)(v59 + v63);
            *(v72 - 2) = *((_DWORD *)v66 - 59);
            v73 = (_DWORD *)(v60 + v63);
            *(v73 - 2) = *((_DWORD *)v66 - 60);
            float v74 = *(v66 - 62) * 1.49852322e11;
            v75 = (float *)(v61 + v63);
            *(v75 - 2) = v74;
            v76 = (_DWORD *)(v62 + v63);
            *(v76 - 2) = *((_DWORD *)v66 - 42);
            *(v70 - 1) = *v65;
            *(v69 - 1) = v64;
            *(v68 - 1) = 1;
            v67[-1] = vcvtq_f64_f32(*(float32x2_t *)(v66 - 33));
            *(v71 - 1) = *((_DWORD *)v66 - 40);
            *(v72 - 1) = *((_DWORD *)v66 - 38);
            *(v73 - 1) = *((_DWORD *)v66 - 39);
            float v77 = *(v66 - 41) * 1.49852322e11;
            *(v75 - 1) = v77;
            *(v76 - 1) = *((_DWORD *)v66 - 21);
            unsigned char *v70 = *v65;
            v70 += 3;
            unsigned char *v69 = v64;
            v69 += 3;
            unsigned char *v68 = 2;
            v68 += 3;
            float64x2_t *v67 = vcvtq_f64_f32(*(float32x2_t *)(v66 - 12));
            v67 += 3;
            _DWORD *v71 = *((_DWORD *)v66 - 19);
            _DWORD *v72 = *((_DWORD *)v66 - 17);
            _DWORD *v73 = *((_DWORD *)v66 - 18);
            float v78 = *(v66 - 20) * 1.49852322e11;
            float *v75 = v78;
            ++v64;
            v63 += 12;
            _DWORD *v76 = *(_DWORD *)v66;
            v66 += 74;
          }
          while (v63 != 168);
          ++v52;
          v53 += 42;
          v54 += 42;
          v55 += 42;
          v56 += 42;
          v57 += 1084;
          v58 += 168;
          v59 += 168;
          v60 += 168;
          v61 += 168;
          v62 += 168;
        }
        while (v52 != v39);
      }
      id v11 = v100;
      objc_msgSend(*(id *)(v99 + 64), "undistort:distortedPixels:outUndistorted:", (int)objc_msgSend(v97, "length"), objc_msgSend(v97, "cameraPixels"), objc_msgSend(v97, "mutableUndistortedCameraPixels"));
      objc_msgSend(*(id *)(v99 + 64), "backProject:undistortedPixels:withR:outPoints:", (int)objc_msgSend(v97, "length"), objc_msgSend(v97, "undistortedCameraPixels"), objc_msgSend(v97, "mutableEuclideanDistances"), objc_msgSend(v97, "mutablePoints"));
      [v97 applyPerformanceOverrides];
      v42 = v97;
      if (*(unsigned char *)(v99 + 80))
      {
        v79 = [v97 additionalData];
        if (v79
          && ([v97 additionalData],
              v80 = objc_claimAutoreleasedReturnValue(),
              unint64_t v81 = [v80 length],
              LODWORD(v81) = v81 < [v100 length],
              v80,
              v79,
              !v81))
        {
          id v82 = [v97 additionalData];
          v84 = (void *)[v82 bytes];
          id v85 = v100;
          memcpy(v84, (const void *)[v85 bytes], objc_msgSend(v85, "length"));
        }
        else
        {
          id v82 = [v97 additionalData];
          peridot_depth_log("storeRawFramesInPointCloud is on, but point cloud's additionalData is too small (%zu)", [v82 length]);
          v42 = v97;
        }
      }
      uint64_t v86 = [v101 dumpRawFramesPath];
      uint64_t v87 = [v101 dumpPointCloudsPath];
      if (v86 | v87)
      {
        if (*((unsigned char *)v98 + 12))
        {
          CMTime time = *(CMTime *)v98;
          uint64_t v88 = objc_msgSend(NSString, "stringWithFormat:", @"%06.13f", CMTimeGetSeconds(&time));
        }
        else
        {
          uint64_t v88 = +[PDInternalUtils currTimeAsString];
        }
        v89 = (void *)v88;
        if (v86)
        {
          v90 = [NSString stringWithFormat:@"%@/%@.L008", v86, v88];
          [v100 writeToFile:v90 atomically:0];
        }
        if (v87)
        {
          v91 = [NSString stringWithFormat:@"%@/%@.csv", v87, v89];
          [v42 writeToFile:v91 atomically:0];
        }
      }
      id v92 = v42;
    }
  }
  else
  {
    v42 = 0;
  }
  kdebug_trace();
LABEL_69:

  kdebug_trace();
  return v42;
}

+ (unint64_t)generatedPointCloudsLengthForRawSensorDimensions:(CGSize)a3
{
  getInfoForDimensions(a3, (uint64_t)v4);
  return v4[3];
}

- (PDDepthProcessor)initWithSystemCalibrationData:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_5;
  }
  v20.receiver = self;
  v20.super_class = (Class)PDDepthProcessor;
  self = [(PDDepthProcessor *)&v20 init];
  if (!self) {
    goto LABEL_5;
  }
  uint64_t v5 = [v4 peridotModule];
  moduleCalib = self->_moduleCalib;
  self->_moduleCalib = v5;

  uint64_t v7 = [v4 peridotCamera];
  cameraCalib = self->_cameraCalib;
  self->_cameraCalib = v7;

  uint64_t v9 = +[PDUserDefaults defaults];
  self->_storeRawFramesInPointCloud = [v9 storeRawFramesInPointCloud];

  getInfoForDimensions(*MEMORY[0x263F001B0], (uint64_t)v19);
  long long v10 = v19[1];
  self->_presetInfo.dimensions = (CGSize)v19[0];
  *(_OWORD *)&self->_presetInfo.banksPerFrame = v10;
  *(_OWORD *)&self->_presetInfo.additionalSize = v19[2];
  self->_dataBufferPool = 0;
  self->_frameCounter = 0;
  if (peridot::PeridotAlgo::Impl::init((uint64_t)self->_algo._impl.__ptr_.__value_, -[PDPeridotModuleCalibrationData calib](self->_moduleCalib, "calib"), self->_cameraCalib, [v4 platform], 0))
  {
    peridot_depth_log("Failed to initialize algo");
LABEL_5:
    id v11 = 0;
    goto LABEL_6;
  }
  char v13 = +[PDUserDefaults defaults];
  int v14 = [v13 loopDxpResults];

  if (v14)
  {
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    lastOutputs = self->_lastOutputs;
    self->_lastOutputs = v15;
  }
  uint64_t v17 = +[PDUserDefaults defaults];
  uint64_t v18 = [v17 gmoCfgBits];

  NSLog(&cfstr_GmoPddepthproc.isa, v18);
  [*(id *)self->_algo._impl.__ptr_.__value_ setCfgBits:v18];
  self = self;
  id v11 = self;
LABEL_6:

  return v11;
}

- (BOOL)_prepareForPeridotPreset:(int)a3
{
  +[PDUtils getPresetName:](PDUtils, "getPresetName:");
  id v5 = objc_claimAutoreleasedReturnValue();
  peridot_depth_log("PDDepthProcessor preparing for preset %s", (const char *)[v5 UTF8String]);

  value = self->_algo._impl.__ptr_.__value_;
  v49 = (char *)value + 1771256;
  uint64_t v50 = (char *)value + 1796400;
  uint64_t v47 = (char *)value + 1720176;
  uint64_t v48 = (char *)value + 1720980;
  uint64_t v45 = (char *)value + 1614368;
  uint64_t v46 = (char *)value + 1677712;
  uint64_t v43 = (char *)value + 1538948;
  uint64_t v44 = (char *)value + 1589224;
  v41 = (char *)value + 1495680;
  v42 = (char *)value + 1538144;
  uint64_t v39 = (char *)value + 1407192;
  uint64_t v40 = (char *)value + 1432336;
  v37 = (char *)value + 1356112;
  v38 = (char *)value + 1356916;
  v35 = (char *)value + 1250304;
  v36 = (char *)value + 1313648;
  v33 = (char *)value + 1174884;
  v34 = (char *)value + 1225160;
  v30 = (char *)value + 1131616;
  v31 = (char *)value + 1174080;
  uint64_t v28 = (char *)value + 1043128;
  uint64_t v29 = (char *)value + 1068272;
  v26 = (char *)value + 992048;
  v27 = (char *)value + 992852;
  v24 = (char *)value + 886240;
  v25 = (char *)value + 949584;
  uint64_t v22 = (char *)value + 810820;
  uint64_t v23 = (char *)value + 861096;
  objc_super v20 = (char *)value + 767552;
  uint64_t v21 = (char *)value + 810016;
  uint64_t v7 = (char *)value + 704208;
  CVBufferRef v8 = (char *)value + 679064;
  uint64_t v9 = (char *)value + 628788;
  long long v10 = (char *)value + 627984;
  id v11 = (char *)value + 585520;
  id v12 = (char *)value + 522176;
  v32 = self;
  char v13 = (char *)value + 497032;
  int v14 = (char *)value + 446756;
  v15 = (char *)value + 403464;
  *((_DWORD *)value + 100866) = a3;
  int v16 = a3;
  uint64_t v17 = (char *)value + 445952;
  int v18 = peridot::presetToRunMode(v16);
  *(_WORD *)(v15 + 9) = v18;
  v15[11] = BYTE2(v18);
  *((_WORD *)v15 + 12) = v18;
  v15[26] = BYTE2(v18);
  *(_WORD *)uint64_t v17 = v18;
  v17[2] = BYTE2(v18);
  *(_WORD *)int v14 = v18;
  v14[2] = BYTE2(v18);
  *(_WORD *)char v13 = v18;
  v13[2] = BYTE2(v18);
  *(_WORD *)id v12 = v18;
  v12[2] = BYTE2(v18);
  *(_WORD *)id v11 = v18;
  v11[2] = BYTE2(v18);
  *(_WORD *)long long v10 = v18;
  v10[2] = BYTE2(v18);
  *(_WORD *)uint64_t v9 = v18;
  v9[2] = BYTE2(v18);
  *(_WORD *)CVBufferRef v8 = v18;
  v8[2] = BYTE2(v18);
  *(_WORD *)uint64_t v7 = v18;
  v7[2] = BYTE2(v18);
  *(_WORD *)objc_super v20 = v18;
  v20[2] = BYTE2(v18);
  *(_WORD *)uint64_t v21 = v18;
  v21[2] = BYTE2(v18);
  *(_WORD *)uint64_t v22 = v18;
  v22[2] = BYTE2(v18);
  *(_WORD *)uint64_t v23 = v18;
  v23[2] = BYTE2(v18);
  *(_WORD *)v24 = v18;
  v24[2] = BYTE2(v18);
  *(_WORD *)v25 = v18;
  v25[2] = BYTE2(v18);
  *(_WORD *)v26 = v18;
  v26[2] = BYTE2(v18);
  *(_WORD *)v27 = v18;
  v27[2] = BYTE2(v18);
  *(_WORD *)uint64_t v28 = v18;
  v28[2] = BYTE2(v18);
  *(_WORD *)uint64_t v29 = v18;
  v29[2] = BYTE2(v18);
  *(_WORD *)v30 = v18;
  v30[2] = BYTE2(v18);
  *(_WORD *)v31 = v18;
  v31[2] = BYTE2(v18);
  *(_WORD *)v33 = v18;
  v33[2] = BYTE2(v18);
  *(_WORD *)v34 = v18;
  v34[2] = BYTE2(v18);
  *(_WORD *)v35 = v18;
  v35[2] = BYTE2(v18);
  *(_WORD *)v36 = v18;
  v36[2] = BYTE2(v18);
  *(_WORD *)v37 = v18;
  v37[2] = BYTE2(v18);
  *(_WORD *)v38 = v18;
  v38[2] = BYTE2(v18);
  *(_WORD *)uint64_t v39 = v18;
  v39[2] = BYTE2(v18);
  *(_WORD *)uint64_t v40 = v18;
  v40[2] = BYTE2(v18);
  *(_WORD *)v41 = v18;
  v41[2] = BYTE2(v18);
  *(_WORD *)v42 = v18;
  v42[2] = BYTE2(v18);
  *(_WORD *)uint64_t v43 = v18;
  v43[2] = BYTE2(v18);
  *(_WORD *)uint64_t v44 = v18;
  v44[2] = BYTE2(v18);
  *(_WORD *)uint64_t v45 = v18;
  v45[2] = BYTE2(v18);
  *(_WORD *)uint64_t v46 = v18;
  v46[2] = BYTE2(v18);
  *(_WORD *)uint64_t v47 = v18;
  v47[2] = BYTE2(v18);
  *(_WORD *)uint64_t v48 = v18;
  v48[2] = BYTE2(v18);
  *(_WORD *)v49 = v18;
  v49[2] = BYTE2(v18);
  *(_WORD *)uint64_t v50 = v18;
  v50[2] = BYTE2(v18);
  return [(PDDepthProcessor *)v32 prepareDataPool];
}

- (id).cxx_construct
{
}

- (BOOL)setDataBufferPool:(__CVDataBufferPool *)a3
{
  if (a3)
  {
    id v5 = CVDataBufferPoolGetDataBufferAttributes();
    uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F03E00]];
    uint64_t v7 = v6;
    if (!v6) {
      goto LABEL_6;
    }
    CVBufferRef v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F0EE48]];
    int v9 = [v8 unsignedIntValue];

    if (v9 != [MEMORY[0x263F26C98] pixelFormat]) {
      goto LABEL_6;
    }
    long long v10 = [v7 objectForKeyedSubscript:*MEMORY[0x263F0ED30]];
    unint64_t v11 = [v10 unsignedIntegerValue];

    if (v11 < [(PDDepthProcessor *)self requiredStorageBytesForGeneratedPointClouds])
    {
      peridot_depth_log("Got a buffer pool with smaller size (%zu) than required (%zu)", v11, [(PDDepthProcessor *)self requiredStorageBytesForGeneratedPointClouds]);
LABEL_6:

      return 0;
    }
  }
  dataBufferPool = self->_dataBufferPool;
  if (dataBufferPool)
  {
    CFRelease(dataBufferPool);
    self->_dataBufferPool = 0;
  }
  if (a3) {
    self->_dataBufferPool = (__CVDataBufferPool *)CFRetain(a3);
  }
  return 1;
}

- (unint64_t)requiredStorageBytesForGeneratedPointClouds
{
  return self->_presetInfo.requiredBytes;
}

- (BOOL)prepareForPeridotPreset:(int)a3 rawSensorDimensions:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v6 = *(void *)&a3;
  BOOL storeRawFramesInPointCloud = self->_storeRawFramesInPointCloud;
  if (a4.width == 512.0 && a4.height == 768.0)
  {
    unint64_t v11 = 84;
    unint64_t v12 = 2;
  }
  else if (a4.width == 1024.0 && a4.height == 768.0)
  {
    unint64_t v11 = 168;
    unint64_t v12 = 4;
  }
  else if (a4.width == 0.0 && a4.height == 0.0)
  {
    unint64_t v11 = 336;
    unint64_t v12 = 8;
  }
  else
  {
    unint64_t v12 = 8;
    peridot_depth_log("Unknown raw sensor dimensions: %fx%f. Will allow up to %zu banks per frame.", a4.width, a4.height, 8uLL);
    unint64_t v11 = 336;
  }
  if (storeRawFramesInPointCloud) {
    unint64_t v13 = (unint64_t)(width * height);
  }
  else {
    unint64_t v13 = 0;
  }
  unint64_t v14 = [MEMORY[0x263F26C98] requiredStorageBytesForLength:v11 additionalDataSize:v13];
  self->_presetInfo.dimensions.double width = width;
  self->_presetInfo.dimensions.double height = height;
  self->_presetInfo.banksPerFrame = v12;
  self->_presetInfo.pointsPerFrame = v11;
  self->_presetInfo.additionalSize = v13;
  self->_presetInfo.requiredBytes = v14;
  return [(PDDepthProcessor *)self _prepareForPeridotPreset:v6];
}

- (BOOL)prepareDataPool
{
  v8[1] = *MEMORY[0x263EF8340];
  if (self->_dataBufferPool) {
    return 1;
  }
  uint64_t v7 = *MEMORY[0x263F03E00];
  v8[0] = MEMORY[0x263EFFA78];
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [MEMORY[0x263F26C98] pixelFormat];
  [(PDDepthProcessor *)self requiredStorageBytesForGeneratedPointClouds];
  int v5 = CVDataBufferPoolCreate();
  BOOL v2 = v5 == 0;
  if (v5) {
    peridot_depth_log("Error: failed to allocate a new data buffer pool");
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastOutputs, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  value = (id *)self->_algo._impl.__ptr_.__value_;
  self->_algo._impl.__ptr_.__value_ = 0;
  if (value)
  {
    peridot::PeridotAlgo::Impl::~Impl(value);
    MEMORY[0x25A2D62D0]();
  }
  objc_storeStrong((id *)&self->_cameraCalib, 0);
  objc_storeStrong((id *)&self->_moduleCalib, 0);
}

- (id)getInternalState
{
  BOOL v2 = (void *)[*(id *)self->_algo._impl.__ptr_.__value_ copySessionState];
  return v2;
}

- (void)reportSessionStatistics
{
  BOOL v2 = (void **)((char *)self->_algo._impl.__ptr_.__value_ + 1875032);
  if (*v2)
  {
    PeridotTelemetry::reportSessionStatistics((PeridotTelemetry *)((char *)self->_algo._impl.__ptr_.__value_ + 1875032));
    v3 = *v2;
    *BOOL v2 = 0;
  }
}

- (id)generatePointCloudFromRawFrame:(id)a3
{
  long long v5 = *MEMORY[0x263F01090];
  uint64_t v6 = *(void *)(MEMORY[0x263F01090] + 16);
  v3 = [(PDDepthProcessor *)self generatePointCloudFromRawFrame:a3 timestamp:&v5];
  return v3;
}

- (unint64_t)generatedPointCloudsLength
{
  return self->_presetInfo.pointsPerFrame;
}

- (id)delegate
{
  return (id)[*((id *)self->_algo._impl.__ptr_.__value_ + 50318) delegate];
}

- (void)setStoreRawFramesInPointCloud:(BOOL)a3
{
  self->_BOOL storeRawFramesInPointCloud = a3;
}

- (BOOL)storeRawFramesInPointCloud
{
  return self->_storeRawFramesInPointCloud;
}

- (void)dealloc
{
  dataBufferPool = self->_dataBufferPool;
  if (dataBufferPool) {
    CFRelease(dataBufferPool);
  }
  v4.receiver = self;
  v4.super_class = (Class)PDDepthProcessor;
  [(PDDepthProcessor *)&v4 dealloc];
}

+ (unint64_t)expectedBanksPerFrameForRawSensorDimensions:(CGSize)a3
{
  getInfoForDimensions(a3, (uint64_t)v4);
  return v4[2];
}

@end