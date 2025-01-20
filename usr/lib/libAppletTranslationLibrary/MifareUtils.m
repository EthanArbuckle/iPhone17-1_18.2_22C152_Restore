@interface MifareUtils
+ (id)getMcmDataDal:(unsigned __int16)a3 withTransceiver:(id)a4 withError:(id *)a5;
@end

@implementation MifareUtils

+ (id)getMcmDataDal:(unsigned __int16)a3 withTransceiver:(id)a4 withError:(id *)a5
{
  uint64_t v6 = a3;
  v7 = (void *)MEMORY[0x1E4F1CA58];
  id v8 = a4;
  v9 = [v7 dataWithBytesNoCopy:&getMcmDataDal_withTransceiver_withError__getMcDataDal length:5 freeWhenDone:0];
  [v9 appendShortBE:v6];
  v10 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:&getMcmDataDal_withTransceiver_withError__getResponse length:5 freeWhenDone:0];
  v11 = [v8 transceiveAndGetAllData:v9 withGetMoreData:v10 withMoreDataSW:24832 withError:a5];

  return v11;
}

@end