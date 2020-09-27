/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

/**
 *
 * @author yelbetto
 */
public class Operaciones {
    
    public Operaciones(){
    
    }
    
    public int suma(int n1, int n2){
        return n1+n2;
    }
    
    public int multiplicacion(int n1, int n2){
        return n1*n2;
    }
    
    public int mayor(int n1, int n2){
        if (n1>n2){
            return n1;
        } else {
            return n2;
        }
    }
    
    public int potencia(String n1, String n2){
        int numero1 = Integer.parseInt(n1);
        int numero2 = Integer.parseInt(n2);
        
        return (int) Math.pow(numero1,numero2);
    }
    
    public String binario(String n1, String n2){
        long num1 = Long.valueOf(n1);
        long num2 = Long.valueOf(n2);
        String numero1 = conversionBinario(num1);
        String numero2 = conversionBinario(num2);
        
        return n1 + " = " + numero1 + "     ||||     "+ n2 +" = "+ numero2;
    }
    
    public String conversionBinario(long decimal){
        return Long.toBinaryString(decimal);
    }
}
