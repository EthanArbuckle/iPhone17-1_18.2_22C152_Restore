@interface PRProximityDatabase
+ (BOOL)getProximityDeviceParameters:(id *)a3 forDeviceModel:(id)a4 withError:(id *)a5;
+ (char)getDeviceBtRxOffsetFromModel:(int64_t)a3;
+ (char)getDeviceBtTxPowerFromModel:(int64_t)a3;
+ (id)getDeviceData;
+ (int64_t)getPRDeviceModelFromModelId:(id)a3;
+ (int64_t)getScannerDeviceModel;
- (PRProximityDatabase)init;
@end

@implementation PRProximityDatabase

- (PRProximityDatabase)init
{
  return 0;
}

+ (id)getDeviceData
{
  if (+[PRProximityDatabase getDeviceData]::createOnce != -1) {
    dispatch_once(&+[PRProximityDatabase getDeviceData]::createOnce, &__block_literal_global_1);
  }
  v2 = (void *)+[PRProximityDatabase getDeviceData]::proxDeviceData;
  return v2;
}

void __36__PRProximityDatabase_getDeviceData__block_invoke()
{
  v415[5] = *MEMORY[0x1E4F143B8];
  v305 = [NSNumber numberWithInteger:10];
  v414[0] = v305;
  v301 = [NSNumber numberWithInteger:3];
  v412[0] = v301;
  v410[0] = @"rssiImmediate";
  v300 = [NSNumber numberWithInteger:-45];
  v411[0] = v300;
  v410[1] = @"rssiNear";
  v299 = [NSNumber numberWithInteger:-60];
  v411[1] = v299;
  v410[2] = @"sampSize";
  v298 = [NSNumber numberWithInteger:3];
  v411[2] = v298;
  v410[3] = @"Algo";
  v297 = [NSNumber numberWithInteger:2];
  v411[3] = v297;
  v296 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v411 forKeys:v410 count:4];
  v413[0] = v296;
  v295 = [NSNumber numberWithInteger:7];
  v412[1] = v295;
  v408[0] = @"rssiImmediate";
  v294 = [NSNumber numberWithInteger:-38];
  v409[0] = v294;
  v408[1] = @"rssiNear";
  v293 = [NSNumber numberWithInteger:-60];
  v409[1] = v293;
  v408[2] = @"sampSize";
  v292 = [NSNumber numberWithInteger:3];
  v409[2] = v292;
  v408[3] = @"Algo";
  v291 = [NSNumber numberWithInteger:2];
  v409[3] = v291;
  v290 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v409 forKeys:v408 count:4];
  v413[1] = v290;
  v289 = [NSNumber numberWithInteger:6];
  v412[2] = v289;
  v406[0] = @"rssiImmediate";
  v288 = [NSNumber numberWithInteger:-38];
  v407[0] = v288;
  v406[1] = @"rssiNear";
  v287 = [NSNumber numberWithInteger:-60];
  v407[1] = v287;
  v406[2] = @"sampSize";
  v286 = [NSNumber numberWithInteger:3];
  v407[2] = v286;
  v406[3] = @"Algo";
  v285 = [NSNumber numberWithInteger:2];
  v407[3] = v285;
  v284 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v407 forKeys:v406 count:4];
  v413[2] = v284;
  v283 = [NSNumber numberWithInteger:11];
  v412[3] = v283;
  v404[0] = @"rssiImmediate";
  v282 = [NSNumber numberWithInteger:-40];
  v405[0] = v282;
  v404[1] = @"rssiNear";
  v281 = [NSNumber numberWithInteger:-60];
  v405[1] = v281;
  v404[2] = @"sampSize";
  v280 = [NSNumber numberWithInteger:8];
  v405[2] = v280;
  v404[3] = @"Algo";
  v279 = [NSNumber numberWithInteger:3];
  v405[3] = v279;
  v278 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v405 forKeys:v404 count:4];
  v413[3] = v278;
  v277 = [NSNumber numberWithInteger:10];
  v412[4] = v277;
  v402[0] = @"rssiImmediate";
  v276 = [NSNumber numberWithInteger:-40];
  v403[0] = v276;
  v402[1] = @"rssiNear";
  v275 = [NSNumber numberWithInteger:-60];
  v403[1] = v275;
  v402[2] = @"sampSize";
  v274 = [NSNumber numberWithInteger:8];
  v403[2] = v274;
  v402[3] = @"Algo";
  v273 = [NSNumber numberWithInteger:3];
  v403[3] = v273;
  v272 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v403 forKeys:v402 count:4];
  v413[4] = v272;
  v271 = [NSNumber numberWithInteger:8];
  v412[5] = v271;
  v400[0] = @"rssiImmediate";
  v270 = [NSNumber numberWithInteger:-44];
  v401[0] = v270;
  v400[1] = @"rssiNear";
  v269 = [NSNumber numberWithInteger:-60];
  v401[1] = v269;
  v400[2] = @"sampSize";
  v268 = [NSNumber numberWithInteger:8];
  v401[2] = v268;
  v400[3] = @"Algo";
  v267 = [NSNumber numberWithInteger:3];
  v401[3] = v267;
  v266 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v401 forKeys:v400 count:4];
  v413[5] = v266;
  v265 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v413 forKeys:v412 count:6];
  v415[0] = v265;
  v264 = [NSNumber numberWithInteger:11];
  v414[1] = v264;
  v263 = [NSNumber numberWithInteger:3];
  v398[0] = v263;
  v396[0] = @"rssiImmediate";
  v262 = [NSNumber numberWithInteger:-45];
  v397[0] = v262;
  v396[1] = @"rssiNear";
  v261 = [NSNumber numberWithInteger:-60];
  v397[1] = v261;
  v396[2] = @"sampSize";
  v260 = [NSNumber numberWithInteger:3];
  v397[2] = v260;
  v396[3] = @"Algo";
  v259 = [NSNumber numberWithInteger:2];
  v397[3] = v259;
  v258 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v397 forKeys:v396 count:4];
  v399[0] = v258;
  v257 = [NSNumber numberWithInteger:7];
  v398[1] = v257;
  v394[0] = @"rssiImmediate";
  v256 = [NSNumber numberWithInteger:-38];
  v395[0] = v256;
  v394[1] = @"rssiNear";
  v255 = [NSNumber numberWithInteger:-60];
  v395[1] = v255;
  v394[2] = @"sampSize";
  v254 = [NSNumber numberWithInteger:3];
  v395[2] = v254;
  v394[3] = @"Algo";
  v253 = [NSNumber numberWithInteger:2];
  v395[3] = v253;
  v252 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v395 forKeys:v394 count:4];
  v399[1] = v252;
  v251 = [NSNumber numberWithInteger:6];
  v398[2] = v251;
  v392[0] = @"rssiImmediate";
  v250 = [NSNumber numberWithInteger:-38];
  v393[0] = v250;
  v392[1] = @"rssiNear";
  v249 = [NSNumber numberWithInteger:-60];
  v393[1] = v249;
  v392[2] = @"sampSize";
  v248 = [NSNumber numberWithInteger:3];
  v393[2] = v248;
  v392[3] = @"Algo";
  v247 = [NSNumber numberWithInteger:2];
  v393[3] = v247;
  v246 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v393 forKeys:v392 count:4];
  v399[2] = v246;
  v245 = [NSNumber numberWithInteger:15];
  v398[3] = v245;
  v390[0] = @"rssiImmediate";
  v244 = [NSNumber numberWithInteger:-40];
  v391[0] = v244;
  v390[1] = @"rssiNear";
  v243 = [NSNumber numberWithInteger:-60];
  v391[1] = v243;
  v390[2] = @"sampSize";
  v242 = [NSNumber numberWithInteger:16];
  v391[2] = v242;
  v390[3] = @"Algo";
  v241 = [NSNumber numberWithInteger:3];
  v391[3] = v241;
  v240 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v391 forKeys:v390 count:4];
  v399[3] = v240;
  v239 = [NSNumber numberWithInteger:11];
  v398[4] = v239;
  v388[0] = @"rssiImmediate";
  v238 = [NSNumber numberWithInteger:-45];
  v389[0] = v238;
  v388[1] = @"rssiNear";
  v237 = [NSNumber numberWithInteger:-60];
  v389[1] = v237;
  v388[2] = @"sampSize";
  v236 = [NSNumber numberWithInteger:16];
  v389[2] = v236;
  v388[3] = @"Algo";
  v235 = [NSNumber numberWithInteger:3];
  v389[3] = v235;
  v234 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v389 forKeys:v388 count:4];
  v399[4] = v234;
  v233 = [NSNumber numberWithInteger:14];
  v398[5] = v233;
  v386[0] = @"rssiImmediate";
  v232 = [NSNumber numberWithInteger:-41];
  v387[0] = v232;
  v386[1] = @"rssiNear";
  v231 = [NSNumber numberWithInteger:-60];
  v387[1] = v231;
  v386[2] = @"sampSize";
  v230 = [NSNumber numberWithInteger:16];
  v387[2] = v230;
  v386[3] = @"Algo";
  v229 = [NSNumber numberWithInteger:3];
  v387[3] = v229;
  v228 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v387 forKeys:v386 count:4];
  v399[5] = v228;
  v227 = [NSNumber numberWithInteger:12];
  v398[6] = v227;
  v384[0] = @"rssiImmediate";
  v226 = [NSNumber numberWithInteger:-40];
  v385[0] = v226;
  v384[1] = @"rssiNear";
  v225 = [NSNumber numberWithInteger:-60];
  v385[1] = v225;
  v384[2] = @"sampSize";
  v224 = [NSNumber numberWithInteger:16];
  v385[2] = v224;
  v384[3] = @"Algo";
  v223 = [NSNumber numberWithInteger:3];
  v385[3] = v223;
  v222 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v385 forKeys:v384 count:4];
  v399[6] = v222;
  v221 = [NSNumber numberWithInteger:13];
  v398[7] = v221;
  v382[0] = @"rssiImmediate";
  v220 = [NSNumber numberWithInteger:-40];
  v383[0] = v220;
  v382[1] = @"rssiNear";
  v219 = [NSNumber numberWithInteger:-60];
  v383[1] = v219;
  v382[2] = @"sampSize";
  v218 = [NSNumber numberWithInteger:16];
  v383[2] = v218;
  v382[3] = @"Algo";
  v217 = [NSNumber numberWithInteger:3];
  v383[3] = v217;
  v216 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v383 forKeys:v382 count:4];
  v399[7] = v216;
  v215 = [NSNumber numberWithInteger:10];
  v398[8] = v215;
  v380[0] = @"rssiImmediate";
  v214 = [NSNumber numberWithInteger:-40];
  v381[0] = v214;
  v380[1] = @"rssiNear";
  v213 = [NSNumber numberWithInteger:-60];
  v381[1] = v213;
  v380[2] = @"sampSize";
  v212 = [NSNumber numberWithInteger:8];
  v381[2] = v212;
  v380[3] = @"Algo";
  v211 = [NSNumber numberWithInteger:3];
  v381[3] = v211;
  v210 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v381 forKeys:v380 count:4];
  v399[8] = v210;
  v209 = [NSNumber numberWithInteger:8];
  v398[9] = v209;
  v378[0] = @"rssiImmediate";
  v208 = [NSNumber numberWithInteger:-39];
  v379[0] = v208;
  v378[1] = @"rssiNear";
  v207 = [NSNumber numberWithInteger:-60];
  v379[1] = v207;
  v378[2] = @"sampSize";
  v206 = [NSNumber numberWithInteger:16];
  v379[2] = v206;
  v378[3] = @"Algo";
  v205 = [NSNumber numberWithInteger:3];
  v379[3] = v205;
  v204 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v379 forKeys:v378 count:4];
  v399[9] = v204;
  v203 = [NSNumber numberWithInteger:9];
  v398[10] = v203;
  v376[0] = @"rssiImmediate";
  v202 = [NSNumber numberWithInteger:-42];
  v377[0] = v202;
  v376[1] = @"rssiNear";
  v201 = [NSNumber numberWithInteger:-60];
  v377[1] = v201;
  v376[2] = @"sampSize";
  v200 = [NSNumber numberWithInteger:8];
  v377[2] = v200;
  v376[3] = @"Algo";
  v199 = [NSNumber numberWithInteger:3];
  v377[3] = v199;
  v198 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v377 forKeys:v376 count:4];
  v399[10] = v198;
  v197 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v399 forKeys:v398 count:11];
  v415[1] = v197;
  v196 = [NSNumber numberWithInteger:12];
  v414[2] = v196;
  v195 = [NSNumber numberWithInteger:3];
  v374[0] = v195;
  v372[0] = @"rssiImmediate";
  v194 = [NSNumber numberWithInteger:-45];
  v373[0] = v194;
  v372[1] = @"rssiNear";
  v193 = [NSNumber numberWithInteger:-60];
  v373[1] = v193;
  v372[2] = @"sampSize";
  v192 = [NSNumber numberWithInteger:3];
  v373[2] = v192;
  v372[3] = @"Algo";
  v191 = [NSNumber numberWithInteger:2];
  v373[3] = v191;
  v190 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v373 forKeys:v372 count:4];
  v375[0] = v190;
  v189 = [NSNumber numberWithInteger:7];
  v374[1] = v189;
  v370[0] = @"rssiImmediate";
  v188 = [NSNumber numberWithInteger:-38];
  v371[0] = v188;
  v370[1] = @"rssiNear";
  v187 = [NSNumber numberWithInteger:-60];
  v371[1] = v187;
  v370[2] = @"sampSize";
  v186 = [NSNumber numberWithInteger:3];
  v371[2] = v186;
  v370[3] = @"Algo";
  v185 = [NSNumber numberWithInteger:2];
  v371[3] = v185;
  v184 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v371 forKeys:v370 count:4];
  v375[1] = v184;
  v183 = [NSNumber numberWithInteger:6];
  v374[2] = v183;
  v368[0] = @"rssiImmediate";
  v182 = [NSNumber numberWithInteger:-38];
  v369[0] = v182;
  v368[1] = @"rssiNear";
  v181 = [NSNumber numberWithInteger:-60];
  v369[1] = v181;
  v368[2] = @"sampSize";
  v180 = [NSNumber numberWithInteger:3];
  v369[2] = v180;
  v368[3] = @"Algo";
  v179 = [NSNumber numberWithInteger:2];
  v369[3] = v179;
  v178 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v369 forKeys:v368 count:4];
  v375[2] = v178;
  v177 = [NSNumber numberWithInteger:15];
  v374[3] = v177;
  v366[0] = @"rssiImmediate";
  v176 = [NSNumber numberWithInteger:-40];
  v367[0] = v176;
  v366[1] = @"rssiNear";
  v175 = [NSNumber numberWithInteger:-60];
  v367[1] = v175;
  v366[2] = @"sampSize";
  v174 = [NSNumber numberWithInteger:16];
  v367[2] = v174;
  v366[3] = @"Algo";
  v173 = [NSNumber numberWithInteger:3];
  v367[3] = v173;
  v172 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v367 forKeys:v366 count:4];
  v375[3] = v172;
  v171 = [NSNumber numberWithInteger:11];
  v374[4] = v171;
  v364[0] = @"rssiImmediate";
  v170 = [NSNumber numberWithInteger:-40];
  v365[0] = v170;
  v364[1] = @"rssiNear";
  v169 = [NSNumber numberWithInteger:-60];
  v365[1] = v169;
  v364[2] = @"sampSize";
  v168 = [NSNumber numberWithInteger:16];
  v365[2] = v168;
  v364[3] = @"Algo";
  v167 = [NSNumber numberWithInteger:3];
  v365[3] = v167;
  v166 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v365 forKeys:v364 count:4];
  v375[4] = v166;
  v165 = [NSNumber numberWithInteger:14];
  v374[5] = v165;
  v362[0] = @"rssiImmediate";
  v164 = [NSNumber numberWithInteger:-40];
  v363[0] = v164;
  v362[1] = @"rssiNear";
  v163 = [NSNumber numberWithInteger:-60];
  v363[1] = v163;
  v362[2] = @"sampSize";
  v162 = [NSNumber numberWithInteger:16];
  v363[2] = v162;
  v362[3] = @"Algo";
  v161 = [NSNumber numberWithInteger:3];
  v363[3] = v161;
  v160 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v363 forKeys:v362 count:4];
  v375[5] = v160;
  v159 = [NSNumber numberWithInteger:12];
  v374[6] = v159;
  v360[0] = @"rssiImmediate";
  v158 = [NSNumber numberWithInteger:-37];
  v361[0] = v158;
  v360[1] = @"rssiNear";
  v157 = [NSNumber numberWithInteger:-60];
  v361[1] = v157;
  v360[2] = @"sampSize";
  v156 = [NSNumber numberWithInteger:16];
  v361[2] = v156;
  v360[3] = @"Algo";
  v155 = [NSNumber numberWithInteger:3];
  v361[3] = v155;
  v154 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v361 forKeys:v360 count:4];
  v375[6] = v154;
  v153 = [NSNumber numberWithInteger:13];
  v374[7] = v153;
  v358[0] = @"rssiImmediate";
  v152 = [NSNumber numberWithInteger:-37];
  v359[0] = v152;
  v358[1] = @"rssiNear";
  v151 = [NSNumber numberWithInteger:-60];
  v359[1] = v151;
  v358[2] = @"sampSize";
  v150 = [NSNumber numberWithInteger:16];
  v359[2] = v150;
  v358[3] = @"Algo";
  v149 = [NSNumber numberWithInteger:3];
  v359[3] = v149;
  v148 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v359 forKeys:v358 count:4];
  v375[7] = v148;
  v147 = [NSNumber numberWithInteger:10];
  v374[8] = v147;
  v356[0] = @"rssiImmediate";
  v146 = [NSNumber numberWithInteger:-40];
  v357[0] = v146;
  v356[1] = @"rssiNear";
  v145 = [NSNumber numberWithInteger:-60];
  v357[1] = v145;
  v356[2] = @"sampSize";
  v144 = [NSNumber numberWithInteger:8];
  v357[2] = v144;
  v356[3] = @"Algo";
  v143 = [NSNumber numberWithInteger:3];
  v357[3] = v143;
  v142 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v357 forKeys:v356 count:4];
  v375[8] = v142;
  v141 = [NSNumber numberWithInteger:8];
  v374[9] = v141;
  v354[0] = @"rssiImmediate";
  v140 = [NSNumber numberWithInteger:-36];
  v355[0] = v140;
  v354[1] = @"rssiNear";
  v139 = [NSNumber numberWithInteger:-60];
  v355[1] = v139;
  v354[2] = @"sampSize";
  v138 = [NSNumber numberWithInteger:16];
  v355[2] = v138;
  v354[3] = @"Algo";
  v137 = [NSNumber numberWithInteger:3];
  v355[3] = v137;
  v136 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v355 forKeys:v354 count:4];
  v375[9] = v136;
  v135 = [NSNumber numberWithInteger:9];
  v374[10] = v135;
  v352[0] = @"rssiImmediate";
  v134 = [NSNumber numberWithInteger:-39];
  v353[0] = v134;
  v352[1] = @"rssiNear";
  v133 = [NSNumber numberWithInteger:-60];
  v353[1] = v133;
  v352[2] = @"sampSize";
  v132 = [NSNumber numberWithInteger:16];
  v353[2] = v132;
  v352[3] = @"Algo";
  v131 = [NSNumber numberWithInteger:3];
  v353[3] = v131;
  v130 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v353 forKeys:v352 count:4];
  v375[10] = v130;
  v129 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v375 forKeys:v374 count:11];
  v415[2] = v129;
  v128 = [NSNumber numberWithInteger:13];
  v414[3] = v128;
  v127 = [NSNumber numberWithInteger:3];
  v350[0] = v127;
  v348[0] = @"rssiImmediate";
  v126 = [NSNumber numberWithInteger:-45];
  v349[0] = v126;
  v348[1] = @"rssiNear";
  v125 = [NSNumber numberWithInteger:-60];
  v349[1] = v125;
  v348[2] = @"sampSize";
  v124 = [NSNumber numberWithInteger:3];
  v349[2] = v124;
  v348[3] = @"Algo";
  v123 = [NSNumber numberWithInteger:2];
  v349[3] = v123;
  v122 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v349 forKeys:v348 count:4];
  v351[0] = v122;
  v121 = [NSNumber numberWithInteger:7];
  v350[1] = v121;
  v346[0] = @"rssiImmediate";
  v120 = [NSNumber numberWithInteger:-38];
  v347[0] = v120;
  v346[1] = @"rssiNear";
  v119 = [NSNumber numberWithInteger:-60];
  v347[1] = v119;
  v346[2] = @"sampSize";
  v118 = [NSNumber numberWithInteger:3];
  v347[2] = v118;
  v346[3] = @"Algo";
  v117 = [NSNumber numberWithInteger:2];
  v347[3] = v117;
  v116 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v347 forKeys:v346 count:4];
  v351[1] = v116;
  v115 = [NSNumber numberWithInteger:6];
  v350[2] = v115;
  v344[0] = @"rssiImmediate";
  v304 = [NSNumber numberWithInteger:-38];
  v345[0] = v304;
  v344[1] = @"rssiNear";
  v114 = [NSNumber numberWithInteger:-60];
  v345[1] = v114;
  v344[2] = @"sampSize";
  v113 = [NSNumber numberWithInteger:3];
  v345[2] = v113;
  v344[3] = @"Algo";
  v112 = [NSNumber numberWithInteger:2];
  v345[3] = v112;
  v111 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v345 forKeys:v344 count:4];
  v351[2] = v111;
  v110 = [NSNumber numberWithInteger:15];
  v350[3] = v110;
  v342[0] = @"rssiImmediate";
  v109 = [NSNumber numberWithInteger:-40];
  v343[0] = v109;
  v342[1] = @"rssiNear";
  v108 = [NSNumber numberWithInteger:-60];
  v343[1] = v108;
  v342[2] = @"sampSize";
  v303 = [NSNumber numberWithInteger:16];
  v343[2] = v303;
  v342[3] = @"Algo";
  v302 = [NSNumber numberWithInteger:3];
  v343[3] = v302;
  v107 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v343 forKeys:v342 count:4];
  v351[3] = v107;
  v106 = [NSNumber numberWithInteger:11];
  v350[4] = v106;
  v340[0] = @"rssiImmediate";
  v105 = [NSNumber numberWithInteger:-40];
  v341[0] = v105;
  v340[1] = @"rssiNear";
  v104 = [NSNumber numberWithInteger:-60];
  v341[1] = v104;
  v340[2] = @"sampSize";
  v103 = [NSNumber numberWithInteger:16];
  v341[2] = v103;
  v340[3] = @"Algo";
  v102 = [NSNumber numberWithInteger:3];
  v341[3] = v102;
  v101 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v341 forKeys:v340 count:4];
  v351[4] = v101;
  v100 = [NSNumber numberWithInteger:14];
  v350[5] = v100;
  v338[0] = @"rssiImmediate";
  v99 = [NSNumber numberWithInteger:-40];
  v339[0] = v99;
  v338[1] = @"rssiNear";
  v98 = [NSNumber numberWithInteger:-60];
  v339[1] = v98;
  v338[2] = @"sampSize";
  v97 = [NSNumber numberWithInteger:16];
  v339[2] = v97;
  v338[3] = @"Algo";
  v96 = [NSNumber numberWithInteger:3];
  v339[3] = v96;
  v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v339 forKeys:v338 count:4];
  v351[5] = v95;
  v94 = [NSNumber numberWithInteger:12];
  v350[6] = v94;
  v336[0] = @"rssiImmediate";
  v93 = [NSNumber numberWithInteger:-37];
  v337[0] = v93;
  v336[1] = @"rssiNear";
  v92 = [NSNumber numberWithInteger:-60];
  v337[1] = v92;
  v336[2] = @"sampSize";
  v91 = [NSNumber numberWithInteger:16];
  v337[2] = v91;
  v336[3] = @"Algo";
  v90 = [NSNumber numberWithInteger:3];
  v337[3] = v90;
  v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v337 forKeys:v336 count:4];
  v351[6] = v89;
  v88 = [NSNumber numberWithInteger:13];
  v350[7] = v88;
  v334[0] = @"rssiImmediate";
  v87 = [NSNumber numberWithInteger:-37];
  v335[0] = v87;
  v334[1] = @"rssiNear";
  v86 = [NSNumber numberWithInteger:-60];
  v335[1] = v86;
  v334[2] = @"sampSize";
  v85 = [NSNumber numberWithInteger:16];
  v335[2] = v85;
  v334[3] = @"Algo";
  v84 = [NSNumber numberWithInteger:3];
  v335[3] = v84;
  v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v335 forKeys:v334 count:4];
  v351[7] = v83;
  v82 = [NSNumber numberWithInteger:10];
  v350[8] = v82;
  v332[0] = @"rssiImmediate";
  v81 = [NSNumber numberWithInteger:-40];
  v333[0] = v81;
  v332[1] = @"rssiNear";
  v80 = [NSNumber numberWithInteger:-60];
  v333[1] = v80;
  v332[2] = @"sampSize";
  v79 = [NSNumber numberWithInteger:8];
  v333[2] = v79;
  v332[3] = @"Algo";
  v78 = [NSNumber numberWithInteger:3];
  v333[3] = v78;
  v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v333 forKeys:v332 count:4];
  v351[8] = v77;
  v76 = [NSNumber numberWithInteger:8];
  v350[9] = v76;
  v330[0] = @"rssiImmediate";
  v75 = [NSNumber numberWithInteger:-36];
  v331[0] = v75;
  v330[1] = @"rssiNear";
  v74 = [NSNumber numberWithInteger:-60];
  v331[1] = v74;
  v330[2] = @"sampSize";
  v73 = [NSNumber numberWithInteger:16];
  v331[2] = v73;
  v330[3] = @"Algo";
  v72 = [NSNumber numberWithInteger:3];
  v331[3] = v72;
  v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v331 forKeys:v330 count:4];
  v351[9] = v71;
  v70 = [NSNumber numberWithInteger:9];
  v350[10] = v70;
  v328[0] = @"rssiImmediate";
  v69 = [NSNumber numberWithInteger:-39];
  v329[0] = v69;
  v328[1] = @"rssiNear";
  v68 = [NSNumber numberWithInteger:-60];
  v329[1] = v68;
  v328[2] = @"sampSize";
  v67 = [NSNumber numberWithInteger:16];
  v329[2] = v67;
  v328[3] = @"Algo";
  v66 = [NSNumber numberWithInteger:3];
  v329[3] = v66;
  v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v329 forKeys:v328 count:4];
  v351[10] = v65;
  v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v351 forKeys:v350 count:11];
  v415[3] = v64;
  v63 = [NSNumber numberWithInteger:14];
  v414[4] = v63;
  v62 = [NSNumber numberWithInteger:3];
  v326[0] = v62;
  v324[0] = @"rssiImmediate";
  v61 = [NSNumber numberWithInteger:-45];
  v325[0] = v61;
  v324[1] = @"rssiNear";
  v60 = [NSNumber numberWithInteger:-60];
  v325[1] = v60;
  v324[2] = @"sampSize";
  v59 = [NSNumber numberWithInteger:3];
  v325[2] = v59;
  v324[3] = @"Algo";
  v58 = [NSNumber numberWithInteger:2];
  v325[3] = v58;
  v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v325 forKeys:v324 count:4];
  v327[0] = v57;
  v56 = [NSNumber numberWithInteger:7];
  v326[1] = v56;
  v322[0] = @"rssiImmediate";
  v55 = [NSNumber numberWithInteger:-38];
  v323[0] = v55;
  v322[1] = @"rssiNear";
  v54 = [NSNumber numberWithInteger:-60];
  v323[1] = v54;
  v322[2] = @"sampSize";
  v53 = [NSNumber numberWithInteger:3];
  v323[2] = v53;
  v322[3] = @"Algo";
  v52 = [NSNumber numberWithInteger:2];
  v323[3] = v52;
  v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v323 forKeys:v322 count:4];
  v327[1] = v51;
  v50 = [NSNumber numberWithInteger:6];
  v326[2] = v50;
  v320[0] = @"rssiImmediate";
  v49 = [NSNumber numberWithInteger:-38];
  v321[0] = v49;
  v320[1] = @"rssiNear";
  v48 = [NSNumber numberWithInteger:-60];
  v321[1] = v48;
  v320[2] = @"sampSize";
  v47 = [NSNumber numberWithInteger:3];
  v321[2] = v47;
  v320[3] = @"Algo";
  v46 = [NSNumber numberWithInteger:2];
  v321[3] = v46;
  v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v321 forKeys:v320 count:4];
  v327[2] = v45;
  v44 = [NSNumber numberWithInteger:15];
  v326[3] = v44;
  v318[0] = @"rssiImmediate";
  v43 = [NSNumber numberWithInteger:-40];
  v319[0] = v43;
  v318[1] = @"rssiNear";
  v42 = [NSNumber numberWithInteger:-60];
  v319[1] = v42;
  v318[2] = @"sampSize";
  v41 = [NSNumber numberWithInteger:16];
  v319[2] = v41;
  v318[3] = @"Algo";
  v40 = [NSNumber numberWithInteger:3];
  v319[3] = v40;
  v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v319 forKeys:v318 count:4];
  v327[3] = v39;
  v38 = [NSNumber numberWithInteger:11];
  v326[4] = v38;
  v316[0] = @"rssiImmediate";
  v37 = [NSNumber numberWithInteger:-41];
  v317[0] = v37;
  v316[1] = @"rssiNear";
  v36 = [NSNumber numberWithInteger:-60];
  v317[1] = v36;
  v316[2] = @"sampSize";
  v35 = [NSNumber numberWithInteger:16];
  v317[2] = v35;
  v316[3] = @"Algo";
  v34 = [NSNumber numberWithInteger:3];
  v317[3] = v34;
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v317 forKeys:v316 count:4];
  v327[4] = v33;
  v32 = [NSNumber numberWithInteger:12];
  v326[5] = v32;
  v314[0] = @"rssiImmediate";
  v31 = [NSNumber numberWithInteger:-40];
  v315[0] = v31;
  v314[1] = @"rssiNear";
  v30 = [NSNumber numberWithInteger:-60];
  v315[1] = v30;
  v314[2] = @"sampSize";
  v29 = [NSNumber numberWithInteger:16];
  v315[2] = v29;
  v314[3] = @"Algo";
  v28 = [NSNumber numberWithInteger:3];
  v315[3] = v28;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v315 forKeys:v314 count:4];
  v327[5] = v27;
  v26 = [NSNumber numberWithInteger:13];
  v326[6] = v26;
  v312[0] = @"rssiImmediate";
  v25 = [NSNumber numberWithInteger:-40];
  v313[0] = v25;
  v312[1] = @"rssiNear";
  v24 = [NSNumber numberWithInteger:-60];
  v313[1] = v24;
  v312[2] = @"sampSize";
  v23 = [NSNumber numberWithInteger:16];
  v313[2] = v23;
  v312[3] = @"Algo";
  v22 = [NSNumber numberWithInteger:3];
  v313[3] = v22;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v313 forKeys:v312 count:4];
  v327[6] = v21;
  v20 = [NSNumber numberWithInteger:10];
  v326[7] = v20;
  v310[0] = @"rssiImmediate";
  v19 = [NSNumber numberWithInteger:-40];
  v311[0] = v19;
  v310[1] = @"rssiNear";
  v18 = [NSNumber numberWithInteger:-60];
  v311[1] = v18;
  v310[2] = @"sampSize";
  v17 = [NSNumber numberWithInteger:8];
  v311[2] = v17;
  v310[3] = @"Algo";
  v16 = [NSNumber numberWithInteger:3];
  v311[3] = v16;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v311 forKeys:v310 count:4];
  v327[7] = v15;
  v14 = [NSNumber numberWithInteger:8];
  v326[8] = v14;
  v308[0] = @"rssiImmediate";
  v13 = [NSNumber numberWithInteger:-39];
  v309[0] = v13;
  v308[1] = @"rssiNear";
  v12 = [NSNumber numberWithInteger:-60];
  v309[1] = v12;
  v308[2] = @"sampSize";
  v11 = [NSNumber numberWithInteger:16];
  v309[2] = v11;
  v308[3] = @"Algo";
  v0 = [NSNumber numberWithInteger:3];
  v309[3] = v0;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v309 forKeys:v308 count:4];
  v327[8] = v1;
  v2 = [NSNumber numberWithInteger:9];
  v326[9] = v2;
  v306[0] = @"rssiImmediate";
  v3 = [NSNumber numberWithInteger:-42];
  v307[0] = v3;
  v306[1] = @"rssiNear";
  v4 = [NSNumber numberWithInteger:-60];
  v307[1] = v4;
  v306[2] = @"sampSize";
  v5 = [NSNumber numberWithInteger:16];
  v307[2] = v5;
  v306[3] = @"Algo";
  v6 = [NSNumber numberWithInteger:3];
  v307[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v307 forKeys:v306 count:4];
  v327[9] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v327 forKeys:v326 count:10];
  v415[4] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v415 forKeys:v414 count:5];
  v10 = (void *)+[PRProximityDatabase getDeviceData]::proxDeviceData;
  +[PRProximityDatabase getDeviceData]::proxDeviceData = v9;
}

+ (BOOL)getProximityDeviceParameters:(id *)a3 forDeviceModel:(id)a4 withError:(id *)a5
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  int64_t v8 = +[PRProximityDatabase getScannerDeviceModel];
  int64_t v9 = +[PRProximityDatabase getPRDeviceModelFromModelId:v7];
  int64_t v10 = v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (v8)
    {
      if (v9)
      {
        v12 = 0;
        BOOL v13 = 0;
        if (!a5) {
          goto LABEL_23;
        }
        goto LABEL_21;
      }
      v22 = @"Unknown Peer model";
    }
    else
    {
      v22 = @"Unknown Scanning device - Proximity Estimation not supported on this device";
    }
    [NSString stringWithFormat:v22];
    v12 = BOOL v13 = 0;
    if (!a5) {
      goto LABEL_23;
    }
LABEL_21:
    if (!v13)
    {
      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      v31[0] = v12;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      *a5 = [v23 errorWithDomain:@"com.apple.Proximity.ErrorDomain" code:999 userInfo:v24];
    }
    goto LABEL_23;
  }
  v29 = +[PRProximityDatabase getDeviceData];
  v14 = [NSNumber numberWithInteger:v8];
  v15 = [v29 objectForKeyedSubscript:v14];

  if (v15)
  {
    v16 = [NSNumber numberWithInteger:v10];
    v17 = [v15 objectForKeyedSubscript:v16];

    BOOL v13 = v17 != 0;
    if (v17)
    {
      v27 = [PRProximityDeviceParameters alloc];
      v28 = [v17 objectForKeyedSubscript:@"Algo"];
      uint64_t v18 = (uint64_t)*(&btFilters + (int)[v28 intValue]);
      v26 = [v17 objectForKeyedSubscript:@"sampSize"];
      uint64_t v19 = [v26 unsignedIntegerValue];
      v20 = [v17 objectForKeyedSubscript:@"rssiImmediate"];
      v21 = [v17 objectForKeyedSubscript:@"rssiNear"];
      *a3 = [(PRProximityDeviceParameters *)v27 initWithFilter:v18 sampleSize:v19 rssiImmediate:v20 rssiNear:v21];

      v12 = 0;
    }
    else
    {
      v12 = [NSString stringWithFormat:@"Proximity Estimation to Peer not supported"];
    }
  }
  else
  {
    v12 = [NSString stringWithFormat:@"Proximity Estimation not supported on this device"];
    BOOL v13 = 0;
  }

  if (a5) {
    goto LABEL_21;
  }
LABEL_23:

  return v13;
}

+ (int64_t)getPRDeviceModelFromModelId:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ([v3 containsString:@"AirPods"])
    {
      int64_t v5 = 3;
    }
    else if ([v4 isEqualToString:@"BeatsSolo3,1"])
    {
      int64_t v5 = 6;
    }
    else if ([v4 isEqualToString:@"Device1,8201"])
    {
      int64_t v5 = 7;
    }
    else if ([v4 isEqualToString:@"SiriRemote"])
    {
      int64_t v5 = 9;
    }
    else if ([v4 containsString:@"iPad"])
    {
      int64_t v5 = 10;
    }
    else if ([v4 containsString:@"iPhone"])
    {
      if (([v4 isEqualToString:@"iPhone10,1"] & 1) != 0
        || [v4 isEqualToString:@"iPhone10,4"])
      {
        int64_t v5 = 12;
      }
      else
      {
        int64_t v5 = 11;
      }
      if (([v4 isEqualToString:@"iPhone10,2"] & 1) != 0
        || [v4 isEqualToString:@"iPhone10,5"])
      {
        int64_t v5 = 13;
      }
      if (([v4 isEqualToString:@"iPhone10,3"] & 1) != 0
        || ([v4 isEqualToString:@"iPhone10,6"] & 1) != 0
        || [v4 containsString:@"iPhone11"])
      {
        int64_t v5 = 14;
      }
    }
    else if ([v4 containsString:@"Watch"])
    {
      int64_t v5 = 15;
    }
    else if ([v4 containsString:@"AppleTV"])
    {
      int64_t v5 = 16;
    }
    else if ([v4 containsString:@"MacPro"])
    {
      int64_t v5 = 20;
    }
    else if ([v4 containsString:@"iMac"])
    {
      int64_t v5 = 19;
    }
    else if ([v4 containsString:@"Mac"])
    {
      int64_t v5 = 18;
    }
    else
    {
      int64_t v5 = 0;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

+ (int64_t)getScannerDeviceModel
{
  v2 = PRGetDeviceModelName();
  int64_t v3 = +[PRProximityDatabase getPRDeviceModelFromModelId:v2];

  return v3;
}

+ (char)getDeviceBtTxPowerFromModel:(int64_t)a3
{
  return -52;
}

+ (char)getDeviceBtRxOffsetFromModel:(int64_t)a3
{
  return 0;
}

@end